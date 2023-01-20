Rails.application.routes.draw do
  devise_for :users
  
  resources :workers
  
  root to: "home#index" 
end
