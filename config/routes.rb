Rails.application.routes.draw do
  resources :menus
    resources :orders
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
