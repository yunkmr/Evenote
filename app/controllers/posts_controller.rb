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
    @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
    @posts = Post.all                #ビューで投稿一覧を表示するために全取得。
    @post = current_user.posts.new   #ビューのform_withのmodelに使う。
  end

  def show
    @post = Post.find(params[:id])  #クリックした投稿を取得。
    # @post_tags = @post.tags         #そのクリックした投稿に紐付けられているタグの取得。
    # respond_to do |format|
    #   format.html
    #   # link_toメソッドをremote: trueに設定したのでリクエストはjs形式で行われる（詳しくは参照記事をご覧ください）
    #   format.js
    # end
    @user = Post.find(params[:id]).user
    @post_comments = @post.post_comments
    @post_comments = Kaminari.paginate_array(@post_comments).page(params[:page]).per(2)

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
