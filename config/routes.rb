Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  root 'articles#index'

  match 'graphql', to: 'graphql#execute', via: %i[get post]

  resources :articles, only: %i[index new create destroy]

  namespace :users do
    resources :sessions, only: %i[create destroy]
  end

  # Nice login/logout routes
  get 'login'    => 'users/sessions#new',      as: :login
  get 'logout'   => 'users/sessions#destroy',  as: :logout
end
