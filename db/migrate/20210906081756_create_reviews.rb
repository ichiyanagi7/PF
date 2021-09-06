class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :mystery_id, :null => false
      t.float :evalution

      t.timestamps
    end
  end
end
