Rails.application.routes.draw do
  # resources :users, only: [:show, :create, :update, :delete]
  resources :saved_recipes

  post "/login", to: "auth#login"
  post "/signup", to: "users#create"
  get "/user", to: "users#current_logged_in_user"
  post "user/saved_recipes", to: "users#saved_recipes"
end
