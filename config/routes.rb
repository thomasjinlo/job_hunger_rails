Rails.application.routes.draw do
  root 'dashboard#index'

  resource :dashboard, only: [:index]

  devise_for :users, controllers: { sessions: 'users/sessions' } do
    get "sign_in" => "users/sessions#new"
    delete "sign_out" => "users/sessions#destroy"
  end

end
