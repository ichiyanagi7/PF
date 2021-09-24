class Comment < ApplicationRecord
  belongs_to :mystery
  belongs_to :user

# バリデーション
  validates :comment, presence: true
  validates :rate, presence: true
end
