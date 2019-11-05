class UsersController < ApplicationController

  # Executed upon user signup
  def create
    user = User.create(user_params)
    if user.valid?
      token = create_token(user.id)
      # token = create_token({ user_id: user.id }) <== This also works for some reason
      render json: { user: user, token: token }, status: :created
    else
      render json: { message: "failed to create user" }, status: :unauthorized
    end
  end

  # Executed during HomePage and FavoritePage initialization
  def current_logged_in_user
    render json: logged_in_user
  end

  # Executed during FavoritePage initialization
  def saved_recipes
    user = User.find_by(username: user_params[:username])
    render json: user.saved_recipes
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
