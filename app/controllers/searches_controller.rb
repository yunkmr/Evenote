class SearchesController < ApplicationController

  def post_search
    # 検索キーワード
    keyword = params["keyword"]

    @tags = Tag.where("tag_name LIKE ?", '%'+keyword+'%' )

    # @tags.each do |tag|
    #   @posts_all = tag.posts
    # end

    @users = User.all
  end

  def user_search
    # 検索対象
    keyword = params["user_name"]
    # 検索キーワード
    @users = User.where("user_name LIKE ?", '%'+keyword+'%' )
    @posts_all = Post.all.order("created_at DESC")
  end

end
