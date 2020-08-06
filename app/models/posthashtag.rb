class Posthashtag < ApplicationRecord
    belongs_to :post
    belongs_to :hash_tag
end
