Rails.application.routes.draw do

  scope :api do
    scope :v1 do

      devise_for :users, controllers: { sessions: 'users/sessions' } do
        get "sign_in" => "users/sessions#new"
        delete "sign_out" => "users/sessions#destroy"
      end

    end
  end

end
