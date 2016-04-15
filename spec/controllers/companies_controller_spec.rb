require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do

  include Devise::TestHelpers

  # describe 'GET#index /companies' do

  #   let(:user){create(:user)}
  #   let(:company){create(:company, user: user)}
  #   let(:json) { JSON.parse(response.body) }

  #   before do
  #     sign_in(user)
  #     company
  #   end

  #   it 'gets all the companies' do
  #     get :index
  #     expect(json["data"].length).to eq(1)
  #   end

  # end

  describe 'POST#create /companies' do

    let(:user) {create(:user)}
    let(:valid_company_attributes) { attributes_for(:company) }

    before do
      @request.env['CONTENT_TYPE'] = "application/vnd.api+json"
      sign_in(user)
    end

    it 'creates a new company with valid parameters' do

      # print valid_company_attributes
      data = { data: {
                type: "companies",
                attributes: {
                  name: "Ember Hamster"
                }
              },
                relationships: {
                  user: {
                    data: { type: "users", id: user.id}
                  }
                }
              }


      post :create, data, format: :json

      print JSON.parse(response.body)

      # expect{post :create, company: valid_company_attributes, format: :json}.to change(Company, :count).by(1)
    end

  end

  # describe 'DELETE/#destroy /companies/:id' do

  #   let(:user){create(:user)}
  #   let(:company){create(:company, user: user)}
   
  #   before do
  #     sign_in(user)
  #     company
  #   end

  #   it 'deletes a company' do
  #     expect{delete :destroy, id: company.id}.to change(Company, :count).by(-1)
  #   end

  # end

end
