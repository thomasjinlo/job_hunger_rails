require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do


include Devise::TestHelpers

 

  describe 'GET#index /companies' do

    let(:user){create(:user)}
    let(:company){create(:company, user: user)}
    let(:json) { JSON.parse(response.body) }

    before do
      sign_in(user)
      company
    end

    it 'gets all the companies' do
      get :index
      expect(json["data"].length).to eq(1)
    end

  end

  # describe 'POST#create /companies' do

  #   let(:user){create(:user)}
  #   let(:valid_company_attributes) { attributes_for(:company, user_id: user.id) }

  #   before do
  #     sign_in(user)
  #   end

  #   it 'creates a new company with valid parameters' do

  #     # request.headers["Content-Type"] = "application/vnd.api+json"

  #     # request.headers{'HTTP_ACCEPT' => 'application/vnd.api+json'}

  #     #  request_headers = {
  #     #   "Accept" => "application/vnd.api+json",
  #     #   "Content-Type" => "application/vnd.api+json"
  #     # }

  #     print valid_company_attributes
  #     print request.headers

  #     post :create, company: valid_company_attributes.to_json

  #      # headers: { 'Content-Type' => 'application/vnd.api+json'}

  #     print JSON.parse(response.body)

  #     expect{post :create, company: valid_company_attributes, format: :json}.to change(Company, :count).by(1)
  #   end

  # end

  describe 'DELETE/#destroy /companies/:id' do

    let(:user){create(:user)}
    let(:company){create(:company, user: user)}
   
    before do
      sign_in(user)
      company
    end

    it 'deletes a company' do
      expect{delete :destroy, id: company.id}.to change(Company, :count).by(-1)
    end

  end

end
