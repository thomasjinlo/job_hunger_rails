class CompaniesController < JSONAPI::ResourceController
  before_action :authenticate_user!
end
