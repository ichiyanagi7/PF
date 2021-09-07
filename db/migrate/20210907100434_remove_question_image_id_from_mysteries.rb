class RemoveQuestionImageIdFromMysteries < ActiveRecord::Migration[5.2]
  def change
    remove_column :mysteries, :question_image_id, :string
    remove_column :mysteries, :answer_image_id, :string
  end
end
