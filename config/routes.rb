Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root 'items#index'

  resources :users, only: [:new, :show, :destroy, :create] do
    resources :cards 
    resources :addresses
  end

  resources :items, except: :index do
    collection do
      get 'buy/:id'=>  'items#buy', as: 'buy'
      # post 'pay/:id'=>   'items#pay', as: 'pay'#httpメソッドはpostなので注意
      # get  'done'=>      'items#done', as: 'done'
      post 'purchase'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "set", defaults: { format: 'json' }
    end
  end
  
  

end
