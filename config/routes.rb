Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root 'items#index'

  resources :users, only: [:new, :show, :destroy, :create] do
    collection do
      get :likes
    end
    resources :credits do
      collection do
        post 'pay', to: 'credits#pay'
        post 'delete', to: 'credits#delete'
      end
    end
    resources :addresses
    resources :drafts, only: :index
    resources :favorites , only: [:index]
  end

  resources :items, except: :index do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "set", defaults: { format: 'json' }
    end
    resources :buys do
      collection do
        post 'pay', to: 'buys#pay'
      end
    end
    resources :comments, only: [:create, :destroy]
    resources :favorites , only: [:create, :destroy]
  end
  
  

end
