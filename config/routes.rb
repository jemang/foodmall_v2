Rails.application.routes.draw do
  root to: "products#index"
  
  resources :products
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users do
    put :impersonate, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
