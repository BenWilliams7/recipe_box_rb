class CreateTableInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.string :name
      t.belongs_to :recipe

      t.timestamps()
    end
  end
end
