=begin
teamJava

No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 1.0
Generated by: https://github.com/openapitools/openapi-generator.git

=end


class PostLoginRequest < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :password

end
