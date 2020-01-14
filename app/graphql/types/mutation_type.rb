module Types
  class MutationType < Types::BaseObject
    # user
    field :create_user, mutation: Mutations::CreateuserMutation
    field :update_user, mutation: Mutations::UpdateuserMutation
    field :delete_user, mutation: Mutations::DeleteuserMutation
  end
end
