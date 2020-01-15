module Types
  class MutationType < Types::BaseObject
    # user
    field :createUser, mutation: Mutations::CreateUserMutation
    field :updateUser, mutation: Mutations::UpdateUserMutation
    field :deleteUser, mutation: Mutations::DeleteUserMutation

    # address
    field :createAddress, mutation: Mutations::CreateAddressMutation
    field :updateAddress, mutation: Mutations::UpdateAddressMutation
    field :deleteAddress, mutation: Mutations::DeleteAddressMutation
  end
end
