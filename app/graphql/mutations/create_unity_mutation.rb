module Mutations
  class CreateUnityMutation < Mutations::BaseMutation
    argument :name, String, required: true

    field :unity, Types::UnityType, null: true
    field :errors, [String], null: true

    def resolve(name:)
      return unauthorized unless verify_admin_authorization

      unity = Unity.new(name: name)
      if unity.save
        { unity: unity }
      else
        { errors: unity.errors.full_messages }
      end
    end
  end
end
