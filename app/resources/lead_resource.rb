class LeadResource < JSONAPI::Resource
  has_one :company

  attributes :name, :linked_in, :blog, :email, :notes
end
