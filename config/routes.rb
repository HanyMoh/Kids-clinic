Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  get 'dashboard/new'
  namespace :reports do
    get "index"
    get "visits_reports"
    get "kids_by_region"
    get "males_by_region"
    get "females_by_region"
    get "kids_by_birthdate"
    get "males_by_birthdate"
    get "females_by_birthdate"
    get "gender_percentage"
    get "visits_by_visit_type"
  end
  resources :visits
  resources :patients
  resources :diagnoses
  resources :regions
  resources :visit_types
  devise_for :users
  resources :users
  root to: 'dashboard#index'
end
