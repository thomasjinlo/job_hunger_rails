class UserResource < JSONAPI::Resource
  has_many :companies

  attributes :email, :password, :score

  filter :email
end
