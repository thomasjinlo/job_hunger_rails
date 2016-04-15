class CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :jobs

  attributes :name, :user_id, :notes, :interest
end
