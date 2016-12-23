Rails.application.routes.draw do
  resources :product_features

  resources :pfeatures

  resources :roles

  resources :products

  mount_devise_token_auth_for 'User', at: 'auth'

end
