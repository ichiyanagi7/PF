class ChangeRateToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :rate, :float, default: 0,null: false
  end
end
