class CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :leads
  
  attributes :name, :user_id, :notes, :interest
end
