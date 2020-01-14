Rails.application.routes.draw do
  mount_graphql_devise_for 'User', at: 'graphql_auth'
  post '/graphql', to: 'graphql#execute'

  mount GraphiQL::Rails::Engine, at: '/graphiql_auth', graphql_path: '/graphql_auth', as: :graphiql_auth if Rails.env.development?
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
end
