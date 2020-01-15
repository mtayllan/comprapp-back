module Mutations
  class UpdateProductMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :description, String, required: false
    argument :stock, Float, required: false
    argument :price_cents, Int, required: false
    argument :unit_id, ID, required: false

    field :product, Types::ProductType, null: true
    field :errors, [String], null: true

    def resolve(args = {})
      return unauthorized unless verify_admin_authorization

      product = Product.find(args[:id])
      if product.update(args.compact)
        { product: product }
      else
        { errors: product.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
