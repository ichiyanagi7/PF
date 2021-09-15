class AddRateToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :rate, :float
    change_column :comments, :rate, :float, default: 0
  end
end
