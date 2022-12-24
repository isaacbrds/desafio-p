Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  resources :equipaments
  resources :places
end
