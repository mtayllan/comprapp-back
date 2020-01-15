module Mutations
  class UpdateUserMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(id:, email: nil, password: nil, name: :nil, role: nil)
      return unauthorized unless verify_admin_authorization

      user = User.find(id)
      if user.update({ email: email, password: password, name: name }.compact)
        user.add_role(role) if role
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
