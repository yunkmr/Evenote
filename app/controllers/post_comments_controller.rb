class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = @post.id
    if @post_comment.save
      @post_comments = @post.post_comments
      @post_comments = Kaminari.paginate_array(@post_comments).page(params[:page]).per(2)
      # binding.pry
      render :index
    else
      render :error
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    render :index

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
