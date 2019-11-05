class CreateJoinTableUsersSavedRecipe < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :saved_recipes do |t|
      t.index [:user_id, :saved_recipe_id]
      t.index [:saved_recipe_id, :user_id]
    end
  end
end
