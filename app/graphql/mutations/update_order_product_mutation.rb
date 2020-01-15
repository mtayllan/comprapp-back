module Mutations
  class UpdateOrderProductMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :order_id, ID, required: true
    argument :amount, Float, required: true

    field :orderProduct, Types::OrderProductType, null: true
    field :errors, [String], null: true

    def resolve(id:, order_id:, amount:)
      current_user = context[:current_user]
      order_product = current_user.orders.find(order_id).order_products.find(id)
      order_product.amount = amount
      if order_product.save
        { orderProduct: order_product }
      else
        { errors: order_product.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
