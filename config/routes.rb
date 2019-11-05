Rails.application.routes.draw do
  post "/login", to: "auth#login"
  post "/signup", to: "users#create"

  get "/user", to: "users#current_logged_in_user"
  post "user/saved_recipes", to: "users#saved_recipes"

  post "/saved_recipes", to: "saved_recipes#create"
  # resources :saved_recipes
end
