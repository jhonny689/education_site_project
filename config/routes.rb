Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'homepage#index'
  resources :student_grads
  resources :user_profiles
  resources :teachers, as: :teacher_courses
  resources :students
  resources :graduation_paths
  resources :courses
  resources :student_grad_courses
  resources :lessons
  resources :tests

end
