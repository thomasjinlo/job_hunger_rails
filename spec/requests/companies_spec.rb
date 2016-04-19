require 'rails_helper'  


describe 'POST#create /companies' do

  let(:user) { create(:user) }
  let(:valid_company_attributes) { attributes_for(:company) }
  let(:json) { JSON.parse(response.body) }


  before do
    # @request.env['CONTENT_TYPE'] = "application/vnd.api+json"
    headers = { 'CONTENT_TYPE' => 'application/vnd.api+json' }
    test_sign_in(user, headers)
  end

  it 'creates a new company with valid parameters' do
    data = { "data": {
              "type": "companies",
              "attributes": {
                "name": "Ember Hamster"
              }
            },
              "relationships": {
                "user": {
                  "data": { "type": "users", "id": user.id}
                }
              }
            }
    post '/companies.json', data, headers
    # expect(json).to eq(4)
  end

end