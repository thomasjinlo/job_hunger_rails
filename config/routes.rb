Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
  #   get "sign_in" => "users/sessions#new"
  #   delete "sign_out" => "users/sessions#destroy"
  # end

  # devise_for :users

  jsonapi_resources :users
  jsonapi_resources :companies
  jsonapi_resources :leads
  jsonapi_resources :jobs
  jsonapi_resources :recommendations
end
