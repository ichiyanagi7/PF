class RenamePublicOnColumnToMysteries < ActiveRecord::Migration[5.2]
  def change
    rename_column :mysteries, :public_on, :published_at
    change_column :mysteries, :published_at, :datetime
  end
end
