Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :paths => 'user'

 
  resources :categories do
  resources :tasks
  end

  # resources :categories
  # resources :tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
