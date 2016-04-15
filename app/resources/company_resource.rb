class CompanyResource < JSONAPI::Resource
  has_one :user

  attributes :name, :notes, :interest, :website, :blog, :address
end
