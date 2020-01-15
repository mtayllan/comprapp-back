module Mutations
  class UpdateAddressMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: true
    field :errors, [String], null: true

    def resolve(id:)
      address = context[:current_user].addresses.find(id)
      if address.destroy
        { address: address }
      else
        { errors: address.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
