class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  validates :email, presence: :true
  validates :username, presence: :true
  validates :email, uniqueness: :true
end
