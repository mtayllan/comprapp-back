module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :stock, Float, null: false
    field :price, String, null: false
    field :priceCents, Int, null: false
    field :unity, Types::UnityType, null: false

    def price
      object.price.to_s
    end
  end
end
