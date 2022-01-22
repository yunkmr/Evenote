class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @calender_events = current_user.events.all
    @events = current_user.events.all.page(params[:page]).per(5).order(date: "DESC")
  end

  def show
    # @event = Event.find(params[:id])
    @album = Album.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to event_path(@event), notice: "イベント情報を登録しました"
    else
      render 'new'
    end

  end

  def edit
    # @event = Event.find(params[:id])
  end

  def update
    # @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "イベント情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    # @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def search

    # 検索対象
    date = params["date"]
    # 検索キーワード
    keyword = params["keyword"]

    artist = params["artist"]

    place = params["place"]

    @events = current_user.events

    if date.present?
      @events = @events.where("date": date)
    end

    if keyword.present?
      @events = @events.where("name LIKE ?", '%'+keyword+'%')
    end

    if artist.present?
      @events = @events.where("artist LIKE ?", '%'+artist+'%')
    end

    if place.present?
      @events = @events.where("place LIKE ?", '%'+place+'%')
    end

    @events = @events.all.page(params[:page]).per(5).order(date: "DESC")

  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :open_time, :start_time, :end_time, :artist, :place, :seat, :with, :memo, :release_flg)
    # params.permit(:name, :date, :open_time, :start_time, :end_time, :place, :seat, :memo)
  end

  def ensure_correct_user
    @event = Event.find(params[:id])
    unless @event.user_id == current_user.id
      redirect_to root_path, notice: "アクセス権限がありません"
    end
  end

end
