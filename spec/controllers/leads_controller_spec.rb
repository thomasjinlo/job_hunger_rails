require 'rails_helper'
include Devise::TestHelpers

RSpec.describe LeadsController, type: :controller do

  describe 'GET #index' do

    let(:json) { JSON.parse(response.body) }

    it 'gets all leads' do
      get :index
      print json
    end
  end
end
