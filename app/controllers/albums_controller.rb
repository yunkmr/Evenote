class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @photo = @album.photos.build
    @albums = @event.albums.includes(:user).order(created_at: "DESC")

  end

  def create
    @event = Event.find(params[:event_id])
    @album = @event.albums.new(album_params)
    # 投稿が成功した場合
    if @album.save
      redirect_to request.referer
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(created_at: "DESC")
      render :index
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @album = Album.find(params[:id])
    # 投稿が成功した場合
    if @album.update(album_params)
      @albums = Album.where(event_id: @event.id)
      redirect_to event_albums_path(event_id: @event)
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(created_at: "DESC")
      render :index
    end
  end

  def index
    @event = Event.find(params[:event_id])

    if params[:id].present?
      @album = Album.find(params[:id])
    else
      @album = Album.new
    end

    @albums = @event.albums.includes(:user).order(created_at: "DESC")
  end

  def index_all
    @albums = current_user.albums
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to request.referer
  end

  private

  def album_params
    params.require(:album).permit(:album_name, photos_attributes: [:memory_image]).merge(user_id: current_user.id)
  end

end
