=begin
teamJava

No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 1.0
Generated by: https://github.com/openapitools/openapi-generator.git

=end


class GetFollowedListsUserId200Response < ApplicationRecord
  validates_presence_of :followed_user_id
  validates_presence_of :followed_user_name

end
