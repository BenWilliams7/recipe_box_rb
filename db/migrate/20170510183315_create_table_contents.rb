class CreateTableContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.belongs_to :recipes
      t.belongs_to :ingredients

      t.timestamps()
    end
  end
end
