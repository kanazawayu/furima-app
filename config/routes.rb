Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users, only: [:new, :show, :destroy, :create] do
    resources :cards 
    resources :buys
    resources :addresses
  end
  resources :items, only: [:new, :create] do
    collection do
      post 'purchase'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  

end
