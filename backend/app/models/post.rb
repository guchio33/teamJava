class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :status
  has_many :post_tag_relation
  has_many :like
  has_many :room
  mount_uploader :image, ImageUploader
end
