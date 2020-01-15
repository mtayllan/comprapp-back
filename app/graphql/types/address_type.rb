module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :street, String, null: true
    field :distric, String, null: true
    field :number, String, null: true
    field :complement, String, null: true
    field :city, String, null: true
    field :user, Types::UserType, null: true
  end
end
