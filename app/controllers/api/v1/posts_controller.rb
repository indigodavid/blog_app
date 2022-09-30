class Api::V1::PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts

    respond_to format do
      format.json { render json: @posts }
      format.html { render json: @posts }
    end
  end
end
