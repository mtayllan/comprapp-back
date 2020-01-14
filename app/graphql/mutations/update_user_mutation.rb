module Mutations
  class UpdateUserMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: true
    argument :password, String, required: false
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(id:, email:, password: nil, name: :nil, role: nil)
      user = User.find(id)
      if user.update({ email: email, password: password, name: name }.compact)
        user.add_role(role) if role && (role == 'admin' && context[:current_user].has_role(:admin))
        { user: user }
      else
        { errors: user.errors }
      end
    end
  end
end
