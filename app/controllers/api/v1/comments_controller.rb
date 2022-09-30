class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    respond_to do |format|
      format.json { render json: @comments }
      format.html { render json: @comments }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = @current_user
    @comment.post = @post
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
