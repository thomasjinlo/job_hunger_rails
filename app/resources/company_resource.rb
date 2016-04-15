class CompanyResource < JSONAPI::Resource
  has_one :user

  attributes :name, :user_id, :notes, :interest
end
