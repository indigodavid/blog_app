class Api::V1::AuthenticationController < ApplicationController
  include JsonWebToken

  skip_before_action :verify_authenticity_token

  def login
    @user = User.find_by_email(params[:email])
    if @user.valid_password? params[:password]
      token = jwt_encode(user_id: @user.id)
      render json: { token: }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
