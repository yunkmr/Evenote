class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @photo = @album.photos.build
    @albums = @event.albums.includes(:user).order(created_at: "DESC")

  end

  def create
    @event = Event.find(params[:event_id])
    @album = @event.albums.new(create_album_params)
    # 投稿が成功した場合
    if @album.save
      redirect_to request.referer, notice: "アルバムを登録しました"
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(created_at: "DESC")
      render :index
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @album = Album.find(params[:id])

    mode = params["mode"]

    binding.pry
    # 投稿が成功した場合
    if @album.update(update_album_params)
      @albums = Album.where(event_id: @event.id)
      if mode == "1"
        redirect_to request.referer, notice: "アルバム名を変更しました"
      else
        redirect_to request.referer, notice: "写真を登録しました"
      end
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(created_at: "DESC")
      redirect_to request.referer
    end
  end

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

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to request.referer
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

end
