Rails.application.routes.draw do


  
  resources :orders


  get 'shopping/index'
  get 'shopping/cart_items'
  post 'shopping/create_order'
  post 'shopping/add_to_cart'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "homes#index"

  
  resources :products do
    resources :reviews, except: [:show, :index]
  end 
  resources :categories

  get 'lihat' => 'products#lihat'
  post 'lihat' => 'products#lihat'




end
