class UpdateTableCategoriesRecipes < ActiveRecord::Migration[5.1]
  def change
    change_table :categories_recipes do |t|
      t.bigint :category_id
      t.bigint :recipe_id

    end

    remove_column :categories_recipes, :categories_id
    remove_column :categories_recipes, :recipes_id
  end
end
