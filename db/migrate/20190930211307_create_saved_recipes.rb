class CreateSavedRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_recipes do |t|
      t.string :title
      t.string :image
      t.integer :recipe_api_id
      t.integer :missing_ingredient_count

      t.timestamps
    end
  end
end
