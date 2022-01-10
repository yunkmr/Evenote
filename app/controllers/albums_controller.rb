class AlbumsController < ApplicationController
  before_action :set_event

  def new
    # @album = Album.new
    # @album.photos.new

    @album = Album.new
    @photo = @album.photos.build
    @albums = @event.albums.includes(:user).order(created_at: "DESC")
  end

  def create
    # @album = Album.new(album_params)
    # @album.user_id = current_user.id

    # if @album.save
    #   redirect_to album_photos_path(@album), notice: 'カートに商品を追加しました'
    # else
    #   redirect_to request.referer
    # end

    @album = @event.albums.new(album_params)
    # 投稿が成功した場合
    if @album.save
      # # 画像が投稿されていないパターンもあるので条件分岐
      # if params[:photos].present?
      #   # フォームで入力されたファイルを一つずつレコードに格納していく
      #   params[:photos][:memory_image_id].each do |a|
      #     @photo = @album.photos.create!(memory_image_id: a, album_id: @album.id)
      #     # binding.pry
      #   end
      # end
      # redirect_to event_album_photos_path(album_id: @album.id)
      redirect_to request.referer
    # 投稿が失敗した場合
    else
      @albums = @event.albums.includes(:user).order(created_at: "DESC")
      render :index
    end

    # @album = Album.new(album_params)
    # @album.user_id = current_user.id
    # @album.event_id = params[:event_id]
    # if @album.save!
    #   redirect_to root_path
    # else
    #   render :new
    # end

  end

  def index
    # @albums = Album.includes(:images).order('created_at DESC')

    # @event = Event.find(params[:event_id])
    # @album = Album.new
    # @photo_image = @album.photos.build
    # @albums = @event.albums.includes(:user).order(created_at: "DESC")

    @album = Album.new
    @albums = @event.albums.includes(:user).order(created_at: "DESC")
  end

  private

  def album_params
    # params.require(:album).permit(:album_name)
    # params.require(:album).permit(:album_name, photos_attributes: [:memory_image]).merge(user_id: current_user.id)
    params.require(:album).permit(:album_name, photos_attributes: [:memory_image]).merge(user_id: current_user.id)
    # params.require(:album).permit(:album_name, photos_attributes: [:id, :memory_image, :_destroy])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
