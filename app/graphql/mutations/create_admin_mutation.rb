module Mutations
  class CreateAdminMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :admin, Types::AdminType, null: true
    field :errors, [String], null: true

    def resolve(email:, password:, name:)
      admin = Admin.new(name: name, email: email, password: password)

      if admin.save
        { admin: admin }
      else
        { errors: admin.errors.full_messages }
      end
    end
  end
end
