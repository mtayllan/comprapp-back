module Mutations
  class CreateProductMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :stock, Float, required: true
    argument :price_cents, Int, required: true
    argument :unit_id, ID, required: true

    field :product, Types::ProductType, null: true
    field :errors, [String], null: true

    def resolve(args = {})
      return unauthorized unless verify_admin_authorization

      product = Product.new(args)
      if product.save
        { product: product }
      else
        { errors: product.errors.full_messages }
      end
    end
  end
end
