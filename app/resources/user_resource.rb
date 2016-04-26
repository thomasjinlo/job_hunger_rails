class UserResource < JSONAPI::Resource
  has_many :companies
  has_many :recommendations
  has_many :jobs
  has_many :leads

  attributes :email, :password, :score, :has_onboarded

  filter :email
end
