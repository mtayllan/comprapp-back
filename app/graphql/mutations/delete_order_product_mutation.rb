module Mutations
  class DeleteOrderProductMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :order_id, ID, required: true

    field :success, Boolean, null: true
    field :errors, [String], null: true

    def resolve(id:, order_id:)
      current_user = context[:current_user]
      order_product = current_user.orders.find(order_id).order_products.find(id)
      if order_product.destroy
        { success: true }
      else
        { errors: order.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
