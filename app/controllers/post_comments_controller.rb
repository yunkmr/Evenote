class PostCommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments.page(params[:page]).per(2)
  end

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = @post.id
    if @post_comment.save
      @post_comments = @post.post_comments.page(params[:page]).per(2)
      @post.create_notification_comment!(current_user, @post_comment.id)
      if params[:page].present?
        render 'pagenate.js.erb'  #２ページ目以降はこっち！！！！
      else
        render 'index.js.erb'
      end

      # render :index
    else
      render :error
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    @post_comments = @post.post_comments.page(params[:page]).per(2)

    if params[:page].present?
      render 'pagenate.js.erb'  #２ページ目以降はこっち！！！！
    else
      render 'index.js.erb'
    end

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
