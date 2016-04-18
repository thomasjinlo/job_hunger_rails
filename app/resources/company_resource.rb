class CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :jobs
  has_many :leads

  attributes :name, :notes, :interest, :website, :blog, :address
end
