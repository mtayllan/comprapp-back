module Mutations
  class DeleteUnityMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :sucess, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      return unauthorized unless verify_admin_authorization

      unity = Unity.find(id)
      if unity.destroy
        { sucess: true }
      else
        { errors: unity.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
