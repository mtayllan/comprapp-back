module Mutations
  class DeleteUserMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :sucess, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      user = User.find(id)

      if user.destroy
        { sucess: true }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
