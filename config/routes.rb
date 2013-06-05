Friendface::Application.routes.draw do
  
  root to: "users#show"

  devise_for :users

  resources :users do
  	resource :profile
  end

end
