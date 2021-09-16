class Mystery < ApplicationRecord
  has_one_attached :question_image
  has_one_attached :answer_image

  has_many :comments,dependent: :destroy
  belongs_to :user
  belongs_to :genre

  has_many :favorites,dependent: :destroy
  has_many :favorited_users,through: :favorites,source: :user

  has_many :reviews,dependent: :destroy

  # お気に入りの有無を確認
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
