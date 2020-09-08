Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'homepage#index'

  resources :user_profiles
  resources :teachers
  resources :students
  resources :graduation_paths
  resources :courses
  resources :lessons
  resources :tests

end
