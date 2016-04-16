Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'users'

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
  #   get "sign_in" => "users/sessions#new"
  #   delete "sign_out" => "users/sessions#destroy"
  # end

  # devise_for :users

  scope :api do
    scope :v1 do
      jsonapi_resources :users
      jsonapi_resources :companies
      jsonapi_resources :leads
      jsonapi_resources :jobs
    end
  end
end
