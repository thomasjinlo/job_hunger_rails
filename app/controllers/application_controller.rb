class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :ensure_correct_media_type, only: [:auth]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
end
