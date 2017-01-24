class AddCatagoryIdToPetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :petitions, :catagory_id, :integer
  end
end
