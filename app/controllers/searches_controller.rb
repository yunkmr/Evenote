class SearchesController < ApplicationController

  def post_search
    # 検索キーワード
    keyword = params["keyword"]

    @tags = Tag.where("tag_name LIKE ?", '%'+keyword+'%' )
    @users = User.where.not(id: current_user.id)
  end

  def user_search
    # 検索対象
    keyword = params["user_name"]
    # 検索キーワード
    @users = User.where.not(id: current_user.id)
    @users = @users.where("user_name LIKE ?", '%'+keyword+'%' )
    @posts_all = Post.all.order("created_at DESC")
  end

  def post_user_search
    # 検索キーワード
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
    @users = User.where.not(id: current_user.id)
  end

end
