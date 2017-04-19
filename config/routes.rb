Rails.application.routes.draw do
  get 'customers/create'

  devise_for :users
  root to: 'pages#home'
  get 'mealplans', to: 'pages#mealplans'
  get 'ourfood', to: 'pages#ourfood'
  get 'order', to: 'pages#order'
  get 'about', to: 'pages#about'
  get 'orderform', to: 'pages#orderform'

  resources :customers, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
