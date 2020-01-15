module Mutations
  class DeleteProductMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :sucess, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      return unauthorized unless verify_admin_authorization

      product = Product.find(id)
      if product.destroy
        { sucess: true }
      else
        { errors: product.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
