Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'mealplans', to: 'pages#mealplans'
  get 'ourfood', to: 'pages#ourfood'
  get 'order', to: 'pages#order'
  get 'about', to: 'pages#about'
  get 'orderform', to: 'pages#orderform'

  # resources :customers, only: [:create, :edit, :update] do
  #   resources :customer_plans, only: [:new, :create] do
  #     resources :extra_items, only: [:new, :create]
  #   end
  # end

  resources :customers, only: [:create, :edit, :update] do
    resources :addresses, only: [:new, :create]
    resources :customer_plans, only: [:new, :create] do
      resources :extra_items, only: [:new, :create]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
