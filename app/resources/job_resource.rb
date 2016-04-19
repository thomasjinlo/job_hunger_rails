class JobResource < JSONAPI::Resource
  has_one :company

  attributes :title, :application_status, :url, :company_id
end
