class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def index
    # @event = Event.find(params[:event_id])
    @items = Item.where(event_id: params[:event_id])

    if params[:id].present?
      @item = Item.find(params[:id])
    else
      @item = Item.new
    end
  end

  def create
    # @event = Event.find(params[:event_id])
    @item = @event.items.new(item_params)
    @item.event_id = @event.id
    if @item.save
      @items = Item.where(event_id: @event.id)
      redirect_to request.referer
    else
      @items = Item.where(event_id: @event.id)
      render 'index'
    end
  end

  def update
    # @event = Event.find(params[:event_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @items = Item.where(event_id: @event.id)
      redirect_to event_items_path(event_id: @event)
    else
      # @item = Item.new
      @items = Item.find(params[:event_id])
      render 'index'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to request.referer
  end

  def destroy_all
  end

  private

  def item_params
    # params.require(:item).permit(:event_id, :name, :quantity, :price)
    params.require(:item).permit(:name, :quantity, :price)
  end

  def ensure_correct_user
    @event = Event.find(params[:event_id])
    unless @event.user_id == current_user.id
      redirect_to root_path, notice: "アクセス権限がありません"
    end
  end

end
