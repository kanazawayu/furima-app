Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users, only: [:new, :show, :destroy, :create] do
    resources :cards 
    resources :buys
  end

  resources :items, only: [:new, :create, :show, :edit, :update] do
    collection do
      post 'purchase'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "set", defaults: { format: 'json' }
    end
  end
  
  

end
