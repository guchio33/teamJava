class School < ApplicationRecord
  belongs_to :department
  belongs_to :faculty
end
