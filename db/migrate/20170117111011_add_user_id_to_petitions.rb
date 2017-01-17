class AddUserIdToPetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :petitions, :user_id, :integer
    add_index :petitions, :user_id
  end
end
