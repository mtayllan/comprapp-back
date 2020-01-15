module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(email:, password:, name:, role: :customer)
      return unauthorized unless verify_admin_authorization

      user = User.new(name: name, email: email, password: password)
      if user.save
        user.add_role(role)
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
