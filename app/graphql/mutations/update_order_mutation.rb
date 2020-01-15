module Mutations
  class UpdateOrderMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :status, String, required: true

    field :order, Types::OrderType, null: true
    field :errors, [String], null: true

    def resolve(id:, status:)
      return unauthorized unless verify_admin_authorization

      order = Order.find(id)
      if order.update(status: status)
        { order: order }
      else
        { errors: order.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
