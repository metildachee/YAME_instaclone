class Comment < ApplicationRecord
  validates :caption, presence: true, length: {minimum: 1}

  belongs_to :user
  belongs_to :post
end
