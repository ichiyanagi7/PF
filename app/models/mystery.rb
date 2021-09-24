class Mystery < ApplicationRecord
  # タグ機能
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  has_one_attached :question_image
  has_one_attached :answer_image

  has_many :comments,dependent: :destroy
  belongs_to :user
  belongs_to :genre

  has_many :favorites,dependent: :destroy
  has_many :favorited_users,through: :favorites,source: :user

  # お気に入りの有無を確認
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum status: {
    published: 0, #公開中
    publish_wait: 1 #公開待ち
  }

  # バリデーション
  validates :title, presence: true
  validates :question, presence: true
  validates :answer, presence: true
  # active storage用バリデーション
  validates :question_image, presence: true, blob: { content_type: :image }
  validate :published_at_check

# 公開時間のバリデーション追加
  def published_at_check
      errors.add(:published_at,"は現在よりも遅い時間を選択してください。") if (self.status == "publish_wait") && (self.published_at < Time.zone.now)
  end

end
