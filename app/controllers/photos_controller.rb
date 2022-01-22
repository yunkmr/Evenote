class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.all.page(params[:page]).per(24).order(created_at: "DESC")
    @photo = Photo.new
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to request.referer
  end

  private

  def ensure_correct_user
    @album = Album.find(params[:album_id])
    unless @album.user_id == current_user.id
      redirect_to root_path, notice: "アクセス権限がありません"
    end
  end


end
