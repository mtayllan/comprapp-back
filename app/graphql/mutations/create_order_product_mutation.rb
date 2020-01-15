module Mutations
  class CreateOrderProductMutation < Mutations::BaseMutation
    argument :amount, Float, required: true
    argument :product_id, ID, required: true
    argument :order_id, ID, required: true

    field :orderProduct, Types::OrderProductType, null: true
    field :errors, [String], null: true

    def resolve(amount:, product_id:, order_id:)
      current_user = context[:current_user]
      order_product = OrderProduct.new(product_id: product_id, amount: amount)
      current_user.orders.find(order_id).order_products << order_product
      if order_product.errors.any?
        { errors: order_product.errors.full_messages }
      else
        { orderProduct: order_product }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
