Rails.application.routes.draw do
  root 'articles#index'

  resources :articles, only: :index

  namespace :users do
    resources :sessions, only: %i[create destroy]
  end

  # Nice login/logout routes
  get 'login'    => 'users/sessions#new',      as: :login
  get 'logout'   => 'users/sessions#destroy',  as: :logout
end
