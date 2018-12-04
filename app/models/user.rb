class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :listings, through: :reservations
  validates_uniqueness_of :username 
end
