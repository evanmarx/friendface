Friendface::Application.routes.draw do
  
  root to: "users#show"

  devise_for :users

  resources :users do
  	resource :profile
  	resources :messages
  end

  resources :friend_requests

  resources :friendships

  

 	resources :notifications
end
