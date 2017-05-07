Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'mealplans', to: 'pages#mealplans'
  get 'ourfood', to: 'pages#ourfood'
  get 'order', to: 'pages#order'
  get 'about', to: 'pages#about'
  get 'orderform', to: 'pages#orderform'

  resources :customers, only: [:create, :edit, :update, :show] do
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :customer_plans, only: [:new, :create, :edit, :update] do
      resources :extra_items, only: [:new, :create, :edit, :update]
      resources :orders, only: [:show, :create] do
        resources :payments, only: [:new, :create]
      end
    end
  end
  patch '/customers/:customer_id/customer_plans/:customer_plan_id/extra_items', to: 'extra_items#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
