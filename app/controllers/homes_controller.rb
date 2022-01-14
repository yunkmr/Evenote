class HomesController < ApplicationController

  def top

    @events = current_user.events
    @events = @events.where("date = ?", Date.today)

    @current_tickets = current_user.tickets

    @entry_tickets = @current_tickets.where(entry_flg: FALSE)
    @entry_tickets = @entry_tickets.all.page(params[:page_1]).per(2).order(entry_start_date: "ASC")

    @win_tickets = @current_tickets.where("win_date >= ?", Date.today)
    @win_tickets = @win_tickets.where('win_flg IS NULL')
    @win_tickets = @win_tickets.all.page(params[:page_2]).per(2).order(win_date: "ASC")

    @payment_tickets = @current_tickets.where("payment_date >= ?", Date.today)
    @payment_tickets = @payment_tickets.where(payment_flg: FALSE)
    @payment_tickets = @payment_tickets.all.page(params[:page_3]).per(2).order(payment_date: "ASC")

  end

end
