class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = current_user.tickets.all.page(params[:page]).per(5).order(event_date: "DESC")
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id

    if @ticket.save
      redirect_to ticket_path(@ticket), notice: "チケット情報を登録しました"
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket), notice: "チケット情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  def search

    # 検索対象
    date_1 = params["date_1"]
    # 検索キーワード
    keyword = params["keyword"]
    # 日付
    search_date = params["search_date"]
    # 日付
    entry = params["entry"]
      # 日付
    win = params["win"]
      # 日付
    payment = params["payment"]
      # 日付
    date_2 = params["date_2"]
      # 日付
    sort = params["sort"]

    @tickets = current_user.tickets

    if keyword.present?
      @tickets = @tickets.where("event_name LIKE ?", '%'+keyword+'%')
    end

    if search_date.present?
      @tickets = @tickets.where("#{date_1}": search_date)
    end

    if entry.present?
      @tickets = @tickets.where(entry_flg: entry)
    end

    if win.present?
      @tickets = @tickets.where(win_flg: win)
    end

    if payment.present?
      @tickets = @tickets.where(payment_flg: payment)
    end

    if date_2.present?
      date_sort = date_2 + " " + sort
      @tickets = @tickets.all.order("#{date_sort}")
    end
    @tickets = @tickets.all.page(params[:page]).per(5).order(event_date: "DESC")

  end

  private

  def ticket_params
    params.require(:ticket).permit(:event_name, :event_date, :number, :money, :entry_start_date, :entry_end_date, :entry_flg, :win_date, :win_flg, :payment_date, :payment_flg)
  end

  def ensure_correct_user
    if Ticket.exists?(id: params[:id])
      @ticket = Ticket.find(params[:id])
      unless @ticket.user_id == current_user.id
        redirect_to root_path, notice: "アクセス権限がありません"
      end
    else
      redirect_to root_path, notice: "アクセス権限がありません"
    end
  end

end
