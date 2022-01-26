class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :destroy]
  before_action :ensure_correct_user_index, only: [:index]

  def index
    @event = Event.find(params[:event_id])

    if params[:id].present?
      @album = Album.find(params[:id])
    else
      @album = Album.new
    end

    @albums = @event.albums.includes(:user).page(params[:page]).per(12).order(created_at: "DESC")
  end

  def index_all
    @albums = current_user.albums.all.page(params[:page]).per(12).order(created_at: "DESC")
  end


  def create
    @event = Event.find(params[:event_id])
    @album = @event.albums.new(create_album_params)
    # 投稿が成功した場合
    if @album.save
      redirect_to request.referer, notice: "アルバムを登録しました"
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(update_at: "DESC")
      render 'index'
    end
  end

  def update
    @event = Event.find(params[:event_id])
    # @album = Album.find(params[:id])

    # 投稿が成功した場合
    if @album.update(update_album_params)
      @albums = Album.where(event_id: @event.id)
      redirect_to event_albums_path, notice: "アルバムを編集しました"
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(update_at: "DESC")
      redirect_to request.referer, notice: "アルバムの編集に失敗しました"
    end
  end

  def destroy
    # @album = Album.find(params[:id])
    @album.destroy
    redirect_to request.referer, notice: "アルバムを削除しました"
  end

  private

  def create_album_params
    # params.require(:album).permit(:album_name, photos_attributes: [:memory_image]).merge(user_id: current_user.id)
    params.require(:album).permit(:album_name).merge(user_id: current_user.id)
  end

  def update_album_params
    # params.require(:album).permit(:album_name, photos_attributes: [:memory_image]).merge(user_id: current_user.id)
    params.require(:album).permit(:album_name, photos_memory_images: []).merge(user_id: current_user.id)
  end

  def ensure_correct_user_index
    if Event.exists?(id: params[:event_id])
      @event = Event.find(params[:event_id])
      unless @event.user_id == current_user.id
        redirect_to root_path, notice: "アクセス権限がありません"
      end
    else
      redirect_to root_path, notice: "アクセス権限がありません"
    end

  end

  def ensure_correct_user
    if Album.exists?(id: params[:id])
      @album = Album.find(params[:id])
      unless @album.user_id == current_user.id
        redirect_to root_path, notice: "アクセス権限がありません"
      end
    else
      redirect_to root_path, notice: "アクセス権限がありません"
    end

  end

end
