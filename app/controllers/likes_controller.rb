class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(like_params)
    @like.author = @user
    @like.post = @post

    if @like.save
      flash[:success] = 'Like saved successfully'
    else
      flash.now[:error] = 'Error: Like could not be saved'
    end
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def like_params
    params.permit(:author, :post)
  end
end
