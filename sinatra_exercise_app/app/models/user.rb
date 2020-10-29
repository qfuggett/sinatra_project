class User < ActiveRecord::Base
  has_secure_password
  has_many :exercises
  validates :email, :username, uniqueness: true
  validates :email, :username, :password, presence: true
end