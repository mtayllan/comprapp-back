module Types
  class MutationType < Types::BaseObject
    # user
    field :create_user, mutation: Mutations::CreateUserMutation
    field :update_user, mutation: Mutations::UpdateUserMutation
    field :delete_user, mutation: Mutations::DeleteUserMutation
  end
end
