class UserResource < JSONAPI::Resource
  has_many :companies
  has_many :recommendations

  attributes :email, :password

  filter :email
end
