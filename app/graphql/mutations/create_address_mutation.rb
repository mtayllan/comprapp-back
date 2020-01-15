module Mutations
  class CreateAddressMutation < Mutations::BaseMutation
    argument :street, String, required: true
    argument :district, String, required: true
    argument :number, String, required: true
    argument :city, String, required: true
    argument :complement, String, required: false

    field :address, Types::AddressType, null: true
    field :errors, [String], null: true

    def resolve(street:, district:, number:, city:, complement: nil)
      current_user = context[:current_user]
      address = Address.new(user_id: current_user.id, street: street, district: district, number: number, city: city, complement: complement)
      if address.save
        { address: address }
      else
        { errors: address.errors.full_messages }
      end
    end
  end
end
