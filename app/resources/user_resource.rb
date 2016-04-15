class UserResource < JSONAPI::Resource
  has_many :companies

  attributes :email
end
