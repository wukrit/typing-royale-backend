Rails.application.routes.draw do
  resources :user_challenges
  resources :challenges, only: [:show, :create]
  resources :prompts, only: [:index, :show]
  resources :users, only: [:show, :create]
  resources :login, only: [:create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
