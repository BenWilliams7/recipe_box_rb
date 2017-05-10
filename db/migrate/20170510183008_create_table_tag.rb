class CreateTableTag < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_recipes do |t|
      t.belongs_to :categories
      t.belongs_to :recipes

      t.timestamps()
    end
  end
end
