class CreateMysteries < ActiveRecord::Migration[5.2]
  def change
    create_table :mysteries do |t|
      t.integer :user_id, :null =>false
      t.integer :genre_id, :null =>false
      t.string :title, :null =>false
      t.text :question, :null =>false
      t.string :question_image_id, :null =>false
      t.string :answer, :null =>false
      t.text :description
      t.string :answer_image_id
      t.text :hint

      t.timestamps
    end
  end
end
