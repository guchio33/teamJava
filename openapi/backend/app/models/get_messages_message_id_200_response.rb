=begin
teamJava

No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 1.0
Generated by: https://github.com/openapitools/openapi-generator.git

=end


class GetMessagesMessageId200Response < ApplicationRecord
  validates_presence_of :message
  validates_presence_of :sent_user_id
  validates_presence_of :user_icon
  validates_presence_of :create_at

end
