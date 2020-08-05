class User < ApplicationRecord

  has_many :posts
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum role: [:user, :vip, :admin]
         after_initialize :set_default_role, :if => :new_record?

         def set_default_role
          self.role ||= :user
        end
end
