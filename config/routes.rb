Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
    get "sign_in" => "users/sessions#new"
    delete "sign_out" => "users/sessions#destroy"
  end

  scope :api do
    scope :v1 do
      jsonapi_resources :users
      jsonapi_resources :companies
        jsonapi_resources :jobs
    end
  end

end
