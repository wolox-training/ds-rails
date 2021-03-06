Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :books, only: %i[index show]
  end
end
