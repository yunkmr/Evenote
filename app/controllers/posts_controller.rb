class PostsController < ApplicationController

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    # フォローユーザーの投稿一覧
    @posts_follow = Post.where(user_id: [*current_user.following_ids])
    # フォローユーザー兼自身の投稿一覧
    # @posts = Post.where(user_id: [current_user.id, *current_user.following_ids])

  end

  def post_all
    # 全投稿一覧(最新の記事投稿順)
    @posts_all = Post.all.order("created_at DESC")

    @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
    # @posts = Post.all                #ビューで投稿一覧を表示するために全取得。
    @post = current_user.posts.new   #ビューのform_withのmodelに使う。

    @users = User.where.not(id: current_user.id)

  end

  def post_mine
    # 自分の投稿
    @posts_my = Post.where(user_id: current_user.id)
    @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
    # @posts = Post.all                #ビューで投稿一覧を表示するために全取得。
    @post = current_user.posts.new   #ビューのform_withのmodelに使う。
  end


  def show
    @post = Post.find(params[:id])  #クリックした投稿を取得。
    @user = Post.find(params[:id]).user
    @post_comments = @post.post_comments.page(params[:page]).per(2)

    @tab_id = params[:tab_id]
    if @tab_id == 1
      @posts = Post.where(user_id: [*current_user.following_ids])
    elsif @tab_id == 2
      @posts = Post.all.order("created_at DESC")
    else
      @posts = Post.where(user_id: current_user.id)
    end

  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all           #クリックしたタグに紐付けられた投稿を全て表示
  end

  private
  def post_params
   params.require(:post).permit(:post_image_id)
  end

end
