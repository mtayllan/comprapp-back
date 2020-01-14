module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :roles, [Types::RoleType], null: false

    def roles
      object.roles
    end
  end
end
