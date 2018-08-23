Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  namespace :reports do
    get "index"
    get "kids_by_region"
    get "kids_by_birthdate"
    get "gender_percentage"
    get "visits_by_visit_type"
  end
  resources :visits
  resources :patients
  resources :medicaments
  resources :diagnoses
  resources :regions
  resources :visit_types
  devise_for :users
  # note: put this after the 'devise_for :users' line
  resources :users, only: [:index, :edit, :update]
  root to: 'dashboard#index'
end
