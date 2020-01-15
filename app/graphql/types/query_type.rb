module Types
  class QueryType < Types::BaseObject
    field :users,
          [Types::UserType],
          null: false,
          description: 'Returns a list of users'
    field :products,
          [Types::ProductType],
          null: false,
          description: 'Returns a list of products'

    def users
      User.all
    end

    def products
      Product.all
    end
  end
end
