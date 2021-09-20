class AddStatusToMysteries < ActiveRecord::Migration[5.2]
  def change
    add_column :mysteries, :status, :integer, default: 0
    change_column :mysteries, :status, :integer,default: 0,null: false
  end
end
