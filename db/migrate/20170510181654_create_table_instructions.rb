class CreateTableInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.belongs_to :recipes

      t.timestamps()
    end
  end
end
