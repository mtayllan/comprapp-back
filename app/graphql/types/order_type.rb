module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :status, String, null: false
    field :user, Types::UserType, null: false
    field :orderProducts, [Types::OrderProductType], null: false
    field :price, String, null: false

    def price
      (object.order_products.sum { |op| op.price_cents * op.amount }).to_s
    end
  end
end
