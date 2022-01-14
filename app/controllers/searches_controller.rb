class SearchesController < ApplicationController

  def search
    @events = Event.where(release_flg: TRUE)
    @users = User.where.not(id: current_user.id)
    # binding.pry

    # 投稿の検索
    keyword = params["keyword"]
    @tags = Tag.where("tag_name LIKE ?", '%'+keyword+'%' )

    # ユーザーの検索
    user_name = params["user_name"]
    @users = @users.where("user_name LIKE ?", '%'+user_name+'%' )

    # イベントの検索
    event_date = params["event_date"]
    event_name = params["event_name"]

    if  (event_date.nil? or event_date == "") and (event_name.nil? or event_name == "")
    elsif event_date.nil? or event_date == ""
      @events = @events.where("name LIKE ?", '%'+event_name+'%')
    elsif event_name.nil? or event_name == ""
      @events = @events.where(date: event_date)
    else
      @events = @events.where("name LIKE ?", '%'+event_name+'%')
      @events = @events.where(date: event_date)
    end

    @serach_id = params["search_id"]
    # binding.pry

  end

  # def post_search
  #   # 検索キーワード
  #   keyword = params["keyword"]

  #   @tags = Tag.where("tag_name LIKE ?", '%'+keyword+'%' )
  #   @users = User.where.not(id: current_user.id)
  #   @events = Event.where(release_flg: TRUE)
  # end

  # def user_search
  #   # 検索対象
  #   keyword = params["user_name"]
  #   # 検索キーワード
  #   @users = User.where.not(id: current_user.id)
  #   @users = @users.where("user_name LIKE ?", '%'+keyword+'%' )
  #   @posts_all = Post.all.order("created_at DESC")
  #   @events = Event.where(release_flg: TRUE)
  # end

  def post_user_search
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
    # @users = User.where.not(id: current_user.id)
    # @events = Event.where(release_flg: TRUE)
  end

  # def event_search
  #   # 検索キーワード
  #   @users = User.where.not(id: current_user.id)
  #   @posts_all = Post.all

  #   # 検索キーワード
  #   event_date = params["event_date"]
  #   event_name = params["event_name"]

  #   # binding.pry
  #   @events = Event.where(release_flg: TRUE)

  #   if  (event_date.nil? or event_date == "") and (event_name.nil? or event_name == "")
  #   elsif event_date.nil? or event_date == ""
  #     @events = @events.where("name LIKE ?", '%'+event_name+'%')
  #   elsif event_name.nil? or event_name == ""
  #     @events = @events.where(date: event_date)
  #   else
  #     @events = @events.where("name LIKE ?", '%'+event_name+'%')
  #     @events = @events.where(date: event_date)
  #   end
  # end

  def event_user_search
    @user = User.find(params[:user_id])
    @events = @user.events.all
    @events = @events.where(release_flg: TRUE)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

end
