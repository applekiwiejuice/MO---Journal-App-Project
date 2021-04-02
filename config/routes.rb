Rails.application.routes.draw do
  root 'home#index'
  # devise_for :users, :paths => 'user'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
  get '/users', to: 'devise/registrations#new'
  get '/users/password', to: 'devise/passwords#new'
  end
 
  resources :categories do
  resources :tasks
  end

  # config/routes.rb
# devise_scope :user do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

  # resources :categories
  # resources :tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
