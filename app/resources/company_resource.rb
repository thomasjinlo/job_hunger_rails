class CompanyResource < JSONAPI::Resource
  has_one :user
  # has_one :company_info

  attributes :name, :user_id, :notes, :interest
end
