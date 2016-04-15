class LeadsController < JSONAPI::ResourceController
  before_action :authenticate_user!
  
end
