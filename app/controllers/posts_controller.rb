class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    # フォローユーザーの投稿一覧
    @posts_follow = Post.where(user_id: [*current_user.following_ids]).all.page(params[:page]).per(12).order(created_at: "DESC")

  end

  def post_all
    # 全投稿一覧(最新の記事投稿順)
    @posts_all = Post.all.page(params[:page]).per(12).order("created_at DESC")

    @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
    @post = current_user.posts.new   #ビューのform_withのmodelに使う。

    @users = User.where.not(id: current_user.id).all.page(params[:page_2]).per(12).order(created_at: "DESC")

    @events = Event.where(release_flg: TRUE).all.page(params[:page_3]).per(12).order(created_at: "DESC")

  end

  def post_mine
    # 自分の投稿
    @posts_my = Post.where(user_id: current_user.id).all.page(params[:page]).per(12).order(created_at: "DESC")

    if params[:id].present?
      @post = Post.find(params[:id])
      @tag_list = @post.tags.pluck(:tag_name).join(' ')
    else
      @post = current_user.posts.new
      @tag_list = ""
    end

  end

  def create
    # 投稿の登録
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to request.referer, notice: "投稿しました"
    else
      @posts_my = Post.where(user_id: current_user.id).all.page(params[:page]).per(12).order(created_at: "DESC")

      if params[:id].present?
        @post = Post.find(params[:id])
        @tag_list = @post.tags.pluck(:tag_name).join(' ')
      else
        @tag_list = ""
      end

      render 'post_mine'
    end
  end

  def update
    # @post = Post.find(params[:id])
    @tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(@tag_list)
      redirect_to post_mine_posts_path, notice: "投稿を編集しました"
    else
      @posts_my = Post.where(user_id: current_user.id).all.page(params[:page]).per(12).order(created_at: "DESC")
      render 'post_mine'
    end
  end


  def show
    # 投稿の詳細ページ表示（モーダル）
    @post = Post.find(params[:id])
    @user = Post.find(params[:id]).user
    @post_comments = @post.post_comments

    @tab_id = params[:tab_id]
    if @tab_id == 1
      @posts = Post.where(user_id: [*current_user.following_ids])
    elsif @tab_id == 2
      @posts = Post.all.order("created_at DESC")
    else
      @posts = Post.where(user_id: current_user.id)
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer, notice: "投稿を削除しました"
  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all           #クリックしたタグに紐付けられた投稿を全て表示
  end

  private

  def post_params
   params.require(:post).permit(:post_image, :maintext)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to root_path, notice: "アクセス権限がありません"
    end
  end

end
