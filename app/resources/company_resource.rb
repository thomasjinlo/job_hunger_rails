class CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :jobs

  attributes :name, :notes, :interest, :website, :blog, :address
end
