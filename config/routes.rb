Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users, only: [:new, :show, :destroy, :create] do
    resources :cards 
    resources :buys
  end
  resources :items, only: [:new, :create] do
    collection do
      post 'purchase'
    end
  end
  
  

end
