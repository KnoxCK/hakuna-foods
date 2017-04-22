Rails.application.routes.draw do
  get 'extra_items/new'

  get 'extra_items/create'

  get 'meal_plans/create'

  get 'customers/create'

  devise_for :users
  root to: 'pages#home'
  get 'mealplans', to: 'pages#mealplans'
  get 'ourfood', to: 'pages#ourfood'
  get 'order', to: 'pages#order'
  get 'about', to: 'pages#about'
  get 'orderform', to: 'pages#orderform'

  resources :customers, only: [:create, :edit, :update] do
    resources :customer_plans, only: [:new, :create] do
      resources :extra_items, only: [:new, :create]
    end
  end
  post 'customers/:id/create_address', to: 'customers#create_address'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
