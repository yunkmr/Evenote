class ItemsController < ApplicationController

  def index
    # @item = Item.new
    @event = Event.find(params[:event_id])
    @items = Item.where(event_id: params[:event_id])

    # @event_id = params[:event_id]

    if params[:id].present?
      @item = Item.find(params[:id])
    else
      @item = Item.new
    end
  end

  # def new
  # end

  def create
    @event = Event.find(params[:event_id])
    @item = @event.items.new(item_params)
    @item.event_id = @event.id
    if @item.save
      # @items = Item.where(event_id: params[:event_id])
      @items = Item.where(event_id: @event.id)
      render 'index'
    else
      @item = Item.new
      @items = Item.where(event_id: @event.id)
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @items = Item.where(event_id: @event.id)
      redirect_to request.referer
    else
      @item = Item.new
      @items = Item.find(params[:event_id])
    end
  end

  def destroy
    @item = Item.find(params[:id])
    # binding.pry
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

end
