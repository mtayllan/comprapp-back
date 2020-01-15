module Mutations
  class UpdateAddressMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :street, String, required: false
    argument :district, String, required: false
    argument :number, String, required: false
    argument :city, String, required: false
    argument :complement, String, required: false

    field :address, Types::AddressType, null: true
    field :errors, [String], null: true

    def resolve(args = {})
      address = context[:current_user].addresses.find(args[:id])
      if address.update(args.compact)
        { address: address }
      else
        { errors: address.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
