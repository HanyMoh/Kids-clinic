Rails.application.routes.draw do
  resources :patients
  resources :regions
  resources :visit_types
  devise_for :users
  root to: 'dashboard#index'
end
