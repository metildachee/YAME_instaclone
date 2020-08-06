class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :main_image

  has_many :posthashtags
  has_many :hashtags, through: :posthashtags

  # after_commit :create_hash_tags, on: :create
  #   def create_hash_tags
  #     extract_name_hash_tags.each do |name|
  #       hashtag = Hashtag.create(name: name)
  #       if Hashtag.create(name: name).save
  #         posthashtag = Posthashtag.create(post: Post.find(id), hash_tag: hashtag)
  #         if posthashtag.save
  #           puts "saved successfully"
  #         end 
  #       end 
  #     end
  # end

  # def extract_name_hash_tags
  #   caption.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  # end

end
