class Post < ApplicationRecord
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  belongs_to :user
  has_many :comments
  has_one_attached :main_image

  # for hashtags
  # after_commit :create_hash_tags, on: :create
  # def create_hash_tags
  #   extract_name_hash_tags.each do |name|
  #     hash_tag = Hashtag.create(name: name)
  #     if hash_tag.save
  #       if Posthashtag.create(post: Post.find(5), hash_tag: hash_tag).save 
  #         puts "saved"
  #       end 
  #     end 
  #   end
  # end

  def extract_name_hash_tags
    caption.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

end
