Friendface::Application.routes.draw do
  
  devise_scope :user do
    root to: "users#show"
  end

  devise_for :users

  resources :users, only: [:show]
end
