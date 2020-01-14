module Types
  class MutationType < Types::BaseObject
    # admin
    field :create_admin, mutation: Mutations::CreateAdminMutation
    field :update_admin, mutation: Mutations::UpdateAdminMutation
    field :delete_admin, mutation: Mutations::DeleteAdminMutation
  end
end
