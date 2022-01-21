class RoomsController < ApplicationController

  before_action :authenticate_user!
  before_action :same_room_user!, only: [:show]

  # 取得している情報はUserRoomsだが、実質Roomのother_userとのリレーションを取得しているためRoomのindexに記述
  def index
    # ログインユーザーが持っているuser_roomのroom_idを取得。
    my_rooms_ids = current_user.user_rooms.select(:room_id)
    # ユーザールームから、room_idがmy_rooms_idsと一致し、user_idがcurrent_user_idではないものを取得。
    @user_rooms = UserRoom.includes(:chats, :user).where(room_id: my_rooms_ids).where.not(user_id: current_user.id).reverse_order
  end

  def create
    user_rooms = UserRoom.find_user_rooms(current_user, params[:user_id])
    if user_rooms.nil?
      room = Room.create
      UserRoom.create(user_id: current_user.id, room_id: room.id)
      UserRoom.create(user_id: params[:user_id], room_id: room.id)
    else
      room = user_rooms.room
    end
    redirect_to room_path(room.id)
  end

  def show
    room = Room.find(params[:id])
    room.check_chats_notification(current_user)
    user_id = room.user_rooms.where.not(user_id: current_user.id).select(:user_id)
    @user = User.where(id: user_id).first!
    @chats = room.chats.includes(:user)
    @chat = Chat.new(room_id: room.id)
  end

  private

 # URLの直打ちによるアクセスを回避
  def same_room_user!
    return if Room.find(params[:id]).users.include?(current_user)

    flash[:danger] = 'ユーザーにはアクセスする権限がありません'
    redirect_to root_path
  end

end
