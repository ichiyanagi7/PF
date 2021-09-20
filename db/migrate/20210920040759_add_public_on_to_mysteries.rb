class AddPublicOnToMysteries < ActiveRecord::Migration[5.2]
  def change
    add_column :mysteries, :public_on, :date
  end
end
