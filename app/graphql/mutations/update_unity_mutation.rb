module Mutations
  class UpdateUnityMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false

    field :unity, Types::UnityType, null: true
    field :errors, [String], null: true

    def resolve(id:, name: :nil)
      return unauthorized unless verify_admin_authorization

      unity = Unity.find(id)
      if unity.update({ name: name }.compact)
        { unity: unity }
      else
        { errors: unity.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
end
