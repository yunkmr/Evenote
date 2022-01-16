class PhotosController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos

  end

  def create
    @album = Album.find(params[:album_id])
    if params[:photos].present?
      # フォームで入力されたファイルを一つずつレコードに格納していく
      params[:photos][:memory_image_id].each do |a|
        @photo = @album.photos.create!(memory_image_id: a, album_id: @album.id)
      end
    end
    redirect_to event_album_photos_path(album_id: @album.id)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to request.referer
  end

  def index_all
    @albums = current_user.albums
  end

end
