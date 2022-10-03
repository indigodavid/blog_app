class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(%i[author comments]).order(created_at: :desc)
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(@post.author)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(params[:user_id]), status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
