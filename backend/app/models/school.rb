class School < ApplicationRecord
  belongs_to :department
  belongs_to :faculty
  has_many :user
end
