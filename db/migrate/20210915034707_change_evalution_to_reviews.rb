class ChangeEvalutionToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :evalution, :float, null: false, default: 0
  end
end
