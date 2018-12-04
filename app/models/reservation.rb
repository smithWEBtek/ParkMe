class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :users
end
