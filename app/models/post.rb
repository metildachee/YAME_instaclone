class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :main_image
  def acceptable_image
    return unless main_image.attached?
  end

  validate :acceptable_image

end
