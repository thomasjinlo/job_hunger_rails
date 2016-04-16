class UserResource < JSONAPI::Resource
  has_many :companies

  attributes :email, :password

  filter :email
end
