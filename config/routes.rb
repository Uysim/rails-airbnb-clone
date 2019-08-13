Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1', controllers: {
    sessions: 'users/sessions'
  }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :properties
    end
  end

  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
