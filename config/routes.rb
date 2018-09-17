Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace :api do
    resources :wishes, only: [:index, :create, :update, :destroy]
  end
end
