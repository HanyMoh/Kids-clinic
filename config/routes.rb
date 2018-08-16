Rails.application.routes.draw do
  get 'users/index'

  get 'users/edit'

  get 'users/update'

  resources :visits
  resources :patients
  resources :regions
  resources :visit_types
  devise_for :users
  root to: 'dashboard#index'
end
