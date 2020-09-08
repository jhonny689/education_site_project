Rails.application.routes.draw do
  root 'homepage#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :profile => 'users/profile' }
  
  devise_scope :user do
    get 'users/:id', to: "users/profile#show", as: 'user'
  end
end


