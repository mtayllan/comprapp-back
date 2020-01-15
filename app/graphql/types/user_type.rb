module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :roles, [Types::RoleType], null: true
    field :addresses, [Types::AddressType], null: true

    delegate :roles, to: :object
    delegate :addresses, to: :object
  end
end
