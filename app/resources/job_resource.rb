class JobResource < JSONAPI::Resource
  has_one :company

  attributes :title
end
