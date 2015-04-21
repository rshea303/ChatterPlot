Rails.application.routes.draw do
  get 'static_pages/home', to: "static_pages#home"
  get 'static_pages/landing', to: "static_pages#landing"
  root 'static_pages#landing'

  resources :users, exclude: [:index]
end
