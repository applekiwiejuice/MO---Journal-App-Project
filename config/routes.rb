Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :paths => 'user'

  resources :user do
  resources :categories do
  resources :tasks
  end
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
