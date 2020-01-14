module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(email:, password:, name:)
      user = User.new(name: name, email: email, password: password)

      if user.save
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
