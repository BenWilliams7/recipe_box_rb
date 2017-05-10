class CreateTableTagCategoriesRecipies < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :recipes do |t|
      t.index :category_id
      t.index :recipe_id

      t.timestamps()
    end
  end
end
