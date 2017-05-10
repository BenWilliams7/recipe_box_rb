class EditTableInstructions < ActiveRecord::Migration[5.1]
  def change
    change_table :instructions do |t|
      t.column :name, :string
    end
  end
end
