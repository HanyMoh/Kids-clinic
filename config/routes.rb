Rails.application.routes.draw do
  resources :medicaments
  resources :diagnoses
  get 'users/index'

  get 'users/edit'

  get 'users/update'
  namespace :reports do
    get "index"
    get "kids_by_region"
    get "kids_by_birthdate"
    get "gender_percentage"
  end
  resources :visits
  resources :patients
  resources :regions
  resources :visit_types
  devise_for :users
  # note: put this after the 'devise_for :users' line
  resources :users, only: [:index, :edit, :update]
  root to: 'dashboard#index'
end
