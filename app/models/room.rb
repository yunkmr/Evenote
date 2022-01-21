class Room < ApplicationRecord

  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :users,  through: :user_rooms

  # チャット通知を既読にするためのメゾット
  def check_chats_notification(current_user)
    unchecked_chats = chats.includes(:user).where(checked: false).where.not(user_id: current_user.id)
    # &.を記述することで、uncheked_chatsがnilの場合エラーをNoMethodErrorを出さずにnilを返す。
    unchecked_chats&.each { |unchecked_chat| unchecked_chat.update(checked: true) }
  end

end
