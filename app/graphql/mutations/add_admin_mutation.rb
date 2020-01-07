module Mutations
  class AddItemMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :admin, Types::AdminType, null: true
    field :errors, Array, null: true

    def resolve(email:, password:)
      check_authentication!

      admin = Admin.new(email: email, password: password)

      if admin.save
        { admin: admin }
      else
        { errors: admin.errors.full_messages }
      end
    end
  end
end
