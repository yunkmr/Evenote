class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @events = Event.where(release_flg: TRUE)
    @users = User.where.not(id: current_user.id)

    # 投稿の検索
    keyword = params["keyword"]
    @tags = Tag.where("tag_name LIKE ?", '%'+keyword+'%' ).order(created_at: "DESC")
    all_post = []
    @tags.each do |tag|
      tag.posts.each do |tag_post|
        unless all_post.include?(tag_post)
          all_post << tag_post
        end
      end
    end

    @posts = Kaminari.paginate_array(all_post).page(params[:page]).per(12)

    # binding.pry

    # ユーザーの検索
    user_name = params["user_name"]
    @users = @users.where("user_name LIKE ?", '%'+user_name+'%' ).all.page(params[:page_2]).per(12).order(created_at: "DESC")

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

    @events = @events.all.page(params[:page_3]).per(12).order(created_at: "DESC")

    @serach_id = params["search_id"]

  end

  def post_user_search
    @user = User.find(params[:user_id])
    @posts = @user.posts.all.page(params[:page]).per(12).order(created_at: "DESC")
  end


  def event_user_search
    @user = User.find(params[:user_id])
    @events = @user.events.all
    @events = @events.where(release_flg: TRUE).all.page(params[:page]).per(12).order(created_at: "DESC")
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

end
