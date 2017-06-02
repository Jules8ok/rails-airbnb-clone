Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :chefs
  resources :menus do
    resources :orders
  end
  root to: 'menus#index'
  get 'pages/home'

  get 'myorders', to: 'orders#myorders'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

