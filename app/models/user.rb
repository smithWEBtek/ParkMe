class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :listings, through: :reservations

  validates :username, uniqueness: true, presence: true





end
