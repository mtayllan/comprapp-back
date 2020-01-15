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
    field :orders,
          [Types::OrderType],
          null: false,
          description: 'Returns a list of orders'

    def users
      return User.all if context[:current_user]&.has_role?(:admin)

      []
    end

    def products
      Product.all
    end

    def orders
      current_user = context[:current_user]
      if current_user&.has_role?(:admin)
        Order.all
      elsif current_user&.has_role?(:customer)
        current_user.orders
      end
      []
    end
  end
end
