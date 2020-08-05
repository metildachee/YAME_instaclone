class Post < ApplicationRecord
  validates :image, presence: true, length: {minimum: 5}
  validates :caption, presence: true, length: {minimum: 5, maximum:100}
  
  belongs_to :user
  has_many :comments
end
