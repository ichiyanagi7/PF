class Genre < ApplicationRecord
  has_many :mysteries,dependent: :destroy
end
