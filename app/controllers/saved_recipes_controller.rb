class SavedRecipesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    # user = User.find_by(id: user_params[:user_id]) <== This also works
    saved_recipe = SavedRecipe.create(saved_recipe_params)
    if saved_recipe.valid?
      user.saved_recipes << saved_recipe
      (render json: saved_recipe, include: [:title, :image, :recipe_api_id, :missing_ingredient_count], status: 201)
    else
      render json: { message: "Recipe cannot be saved" }
    end
  end

  private

  def saved_recipe_params
    params.permit(:title, :image, :recipe_api_id, :missing_ingredient_count)
  end

  def user_params
    params.permit(:user_id)
  end
end

# TODO: Remove these reference methods prior to pushing code to production

# class SavedRecipesController < ApplicationController
#   before_action :find_saved_recipe, only: [:show, :update, :destroy]

#   def index
#     saved_recipes = SavedRecipe.all
#     render json: saved_recipes, status: 200
#     # or render json: saved_recipes, include: [:title, :image, :recipe_api_id, :missing_ingredient_count]
#     # same as //=> render json: saved_recipes, only: [:title, :image, :recipe_api_id, :missing_ingredient_count]
#     # To show nested models, use render json: saved_recipes, include '**'
#   end

#   def show
#     if saved_recipe
#       render json: saved_recipe, status: 200
#       # or render json: saved_recipe, only: [:title, :image, :recipe_api_id, :missing_ingredient_count]
#     else
#       render json: { message: "recipe not found" }
#     end
#   end

#   def create
#     user = User.find(params[:user_id])
#     # user = User.find_by(id: user_params[:user_id]) <== This also works
#     saved_recipe = SavedRecipe.create(saved_recipe_params)
#     if saved_recipe.valid?
#       user.saved_recipes << saved_recipe
#       (render json: saved_recipe, include: [:title, :image, :recipe_api_id, :missing_ingredient_count], status: 201)
#     else
#       render json: { message: "Recipe cannot be saved" }
#     end
#   end

#   def update
#     saved_recipe.update(saved_recipe_params)
#     # render json: saved_recipe, status: 200
#     render json: saved_recipe, include: [:title, :image, :recipe_api_id, :missing_ingredient_count], status: 200
#   end

#   def destroy
#     saved_recipe.destroy
#     render json: { message: "Zap! recipe deleted", recipeId: saved_recipe.id }
#   end

#   private

#   def find_saved_recipe
#     saved_recipe = SavedRecipe.find(params[:id])
#   end

#   def saved_recipe_params
#     params.permit(:title, :image, :recipe_api_id, :missing_ingredient_count)
#   end

#   def user_params
#     params.permit(:user_id)
#   end
# end
