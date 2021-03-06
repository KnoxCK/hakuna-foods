Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'mealplans', to: 'pages#mealplans'
  get 'ourfood', to: 'pages#ourfood'
  get 'order', to: 'pages#order'
  get 'about', to: 'pages#about'
  get 'orderform', to: 'pages#orderform'
  get 'bespoke', to: 'pages#bespoke'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'faqs', to: 'pages#faqs'
  get 'blog', to: 'articles#index'

  resources :articles, only: [:create, :new, :edit, :update]
  resources :customers, only: [:create, :edit, :update, :show] do
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :customer_plans, only: [:new, :create, :edit, :update] do
      resources :extra_items, only: [:new, :create, :edit, :update]
      resources :orders, only: [:show, :create] do
        resources :payments, only: [:new, :create]
      end
    end
  end

  get 'articles/:slug', to: "articles#show", as: :article_page

  resources :newsletter_subscriptions, only: :create
  post '/verify_promo_code', to: 'promo_codes#verify'
  patch '/customers/:customer_id/customer_plans/:customer_plan_id/extra_items', to: 'extra_items#update'
end
