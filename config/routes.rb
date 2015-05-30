Rails.application.routes.draw do
  get '/auth/:provider/callback', to: "sessions#create"
  get 'static_pages/home',        to: "static_pages#home"
  root 'static_pages#home'

  resources :users, exclude: [:index]
  resource  :session

  get '/search', to: "companies#show"
end
