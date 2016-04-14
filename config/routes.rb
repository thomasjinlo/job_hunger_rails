Rails.application.routes.draw do
  root 'dashboard#index'

  resource :dashboard, only: [:index]

  devise_for :users do
    get "sign_in", to: "devise/sessions#new"
    delete "sign_out", :to => "devise/sessions#destroy"
  end

end
