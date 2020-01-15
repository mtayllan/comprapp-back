module Types
  class OrderProductType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :priceCents, Int, null: false
    field :price, String, null: false
    field :product, Types::ProductType, null: false

    def price
      object.price.to_s
    end
  end
end
