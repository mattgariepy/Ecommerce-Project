Rails.application.routes.draw do
  devise_for :users

  get 'about_contacts/about'
  get 'about_contacts/contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: [:index, :show] do
    collection do
      get 'onSale'
      get 'new'
      get 'search'
    end
  end

  resources :categories, only: [:index, :show]

  resources :cart, only: [:create, :destroy]

  root to: 'home#index'
end
