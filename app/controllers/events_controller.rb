class EventsController < ApplicationController

  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
    @album = Album.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to event_path(@event), notice: ""
    else
      redirect_to request.referer
    end

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event), notice: ""
    else
      redirect_to request.referer
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def search

    # 検索対象
    date = params["date"]
    # 検索キーワード
    keyword = params["keyword"]

    @events = current_user.events

    if date.present?
      @events = @events.where("date": date)
    end

    if keyword.present?
      @events = @events.where("name LIKE ?", '%'+keyword+'%')
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :open_time, :start_time, :end_time, :place, :seat, :memo, :release_flg)
    # params.permit(:name, :date, :open_time, :start_time, :end_time, :place, :seat, :memo)
  end

end
