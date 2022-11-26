class Room < ApplicationRecord
  belongs_to :post
  has_many :room_user
  has_many :room_message
end
