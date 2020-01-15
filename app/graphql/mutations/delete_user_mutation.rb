module Mutations
  class DeleteUserMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :sucess, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      return unauthorized unless verify_admin_authorization

      user = User.find(id)
      if user.destroy
        { sucess: true }
      else
        { errors: user.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
