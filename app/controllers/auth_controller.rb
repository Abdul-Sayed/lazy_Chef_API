class AuthController < ApplicationController

  # skip_before_action :authorized, only: [:create]

  def login
    user = User.find_by(username: login_params[:username])
    is_authenticated = user.authenticate(login_params[:password])

    if is_authenticated
      render json: { user: user, token: create_token(user.id) }
    else
      render json: { errors: ["Wrong username or password, youre not real... sorry"] }, status: 422
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
