Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root 'items#index'

  resources :users, only: [:new, :show, :destroy, :create] do
    resources :cards 
    resources :buys
  end
  resources :items, only: [:new, :create] do
    collection do
      post 'purchase'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  

end
