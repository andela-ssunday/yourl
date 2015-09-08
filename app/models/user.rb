class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  validates :email, uniqueness: :true
  validates :email, presence: :true
end
