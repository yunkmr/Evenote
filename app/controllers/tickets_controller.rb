class TicketsController < ApplicationController

  def index
    @tickets = current_user.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id

    if @ticket.save
      redirect_to ticket_path(@ticket), notice: ""
    else
      redirect_to request.referer
    end

  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    binding.pry
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket), notice: ""
    else
      redirect_to request.referer
    end
  end

  def destroy
  end

  def ticket_params
    params.require(:ticket).permit(:event_name, :event_date, :number, :money, :entry_start_date, :entry_end_date, :entry_flg, :win_date, :win_flg, :payment_date, :payment_flg)
  end

end
