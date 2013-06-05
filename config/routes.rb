Friendface::Application.routes.draw do
  
  root to: "users#show"

  devise_for :users

  resources :users do
  	resource :profile
  end

  resources :friend_requests

  resources :friendships

  resources :messages

 	resources :notifications
end
