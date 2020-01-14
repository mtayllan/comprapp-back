module Mutations
  class DeleteAdminMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :sucess, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      admin = Admin.find(id)

      if admin.destroy
        { sucess: true }
      else
        { errors: admin.errors.full_messages }
      end
    end
  end
end
