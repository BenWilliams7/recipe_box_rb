class UpdateTableIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    change_table :ingredients_recipes do |t|
      t.bigint :ingredient_id
      t.bigint :recipe_id

    end

    remove_column :ingredients_recipes, :ingredients_id
    remove_column :ingredients_recipes, :recipes_id
  end
end
