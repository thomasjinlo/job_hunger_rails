require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

include Devise::TestHelpers

  describe 'POST /users' do

    let(:json) { JSON.parse(response.body) }
    let(:valid_user_attributes) { attributes_for(:user) }
    let(:invalid_user_attributes){attributes_for(:user, password: "")}

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'creates a new user with valid attributes' do
      expect{post :create, user: valid_user_attributes, format: :json}.to change{User.count}.by(1)
      expect(json["authentication_token"]).to_not be nil
      expect(response.status).to eq(201)
    end

    it 'does not create a new user with invalid attributes' do
      expect{post :create, user: invalid_user_attributes, format: :json}.to change{User.count}.by(0)
      expect(response.status).to eq(422)
    end



  end

end