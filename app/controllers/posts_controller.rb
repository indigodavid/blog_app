class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes([:comments]).order(created_at: :desc)
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
      redirect_to user_posts_path(@user.id)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
