module Types
  class MutationType < Types::BaseObject
    # user
    field :create_user, mutation: Mutations::CreateUserMutation
    field :update_user, mutation: Mutations::UpdateUserMutation
    field :delete_user, mutation: Mutations::DeleteUserMutation

    # address
    field :create_address, mutation: Mutations::CreateAddressMutation
    field :update_address, mutation: Mutations::UpdateAddressMutation
    field :delete_address, mutation: Mutations::DeleteAddressMutation
  end
end
