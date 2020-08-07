class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :main_image

  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  after_commit :create_hash_tags, on: :create
  def create_hash_tags
    extract_name_hash_tags.each do |name|
      if HashTag.find_by(name: name) != nil # this hash tag already exists
         # we create a new relationship instead
        post_hash_tags.create(hash_tag_id: HashTag.find_by(name: name).id)
      else 
        # this hash tag does not exists, we create and assign it
        hash_tags.create(name: name)
      end 
    end
  end

  def extract_name_hash_tags
    caption.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

end
