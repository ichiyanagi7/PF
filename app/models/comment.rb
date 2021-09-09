class Comment < ApplicationRecord
  belongs_to :mystery
  belongs_to :user
end
