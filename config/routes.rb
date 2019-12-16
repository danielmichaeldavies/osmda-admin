Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root 'articles#index'

  resources :articles, only: %i[index new create destroy]

  namespace :users do
    resources :sessions, only: %i[create destroy]
  end

  # Nice login/logout routes
  get 'login'    => 'users/sessions#new',      as: :login
  get 'logout'   => 'users/sessions#destroy',  as: :logout
end
