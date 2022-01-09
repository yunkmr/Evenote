class PhotosController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos

    # binding.pry
  end

end
