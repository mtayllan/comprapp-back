Rails.application.routes.draw do
  mount_graphql_devise_for 'Admin', at: 'graphql_auth/admin'
  post '/graphql', to: 'graphql#execute'

  mount GraphiQL::Rails::Engine, at: '/graphiql_admin', graphql_path: '/graphql_auth/admin', as: :graphiql_admin if Rails.env.development?
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
end
