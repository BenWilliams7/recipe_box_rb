class UpdateTableInstructions < ActiveRecord::Migration[5.1]
  def change
    change_table :instructions do |t|
      t.bigint :recipe_id

    end

    remove_column :instructions, :recipes_id
  end
end
