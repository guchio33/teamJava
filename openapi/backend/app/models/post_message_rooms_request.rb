=begin
teamJava

No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 1.0
Generated by: https://github.com/openapitools/openapi-generator.git

=end


class PostMessageRoomsRequest < ApplicationRecord
  validates_presence_of :my_user_id
  validates_presence_of :user_id
  validates_presence_of :product_id

end