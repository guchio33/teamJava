class Message < ApplicationRecord
  belongs_to :user
  has_many :room_message
end