class PostCommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
  end

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = @post.id
    if @post_comment.save
      @post_comments = @post.post_comments
      @post.create_notification_comment!(current_user, @post_comment.id)
      render 'index.js.erb'
    else
      render :error
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    @post_comments = @post.post_comments
    render 'index.js.erb'

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
