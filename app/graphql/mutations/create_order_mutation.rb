module Mutations
  class CreateOrderMutation < Mutations::BaseMutation
    argument :status, String, required: true

    field :order, Types::OrderType, null: true
    field :errors, [String], null: true

    def resolve(status:)
      current_user = context[:current_user]
      order = Order.new(user_id: current_user.id, status: status)
      if order.save
        { order: order }
      else
        { errors: order.errors.full_messages }
      end
    end
  end
end
