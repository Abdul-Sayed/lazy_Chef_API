class SavedRecipeSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  attributes :id, :title, :image, :recipe_api_id, :missing_ingredient_count
  has_many :users
end
