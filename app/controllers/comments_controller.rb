class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = @user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_posts_path(@post.author)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author, :post)
  end
end
