class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :image_id, :string
    add_column :users, :is_deleted, :boolean
    
    change_column :users, :is_deleted, :boolean, null: false, default: false
    change_column :users, :name, :string, null: false
  end
end
