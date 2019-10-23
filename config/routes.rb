Rails.application.routes.draw do
  resources :user_challenges, only: [:show, :create]
  resources :challenges, only: [:show, :create, :update]
  resources :prompts, only: [:index, :show]
  resources :users, only: [:show, :create]
  resources :login, only: [:create]
  get 'challenges/:uuid', :to => 'challenges#show'
  patch 'challenges/:uuid/subscribe', :to => 'challenges#subscribe'
  patch 'challenges/:uuid/results', :to => 'challenges#results'

  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
