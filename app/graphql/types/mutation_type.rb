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

    # unity
    field :createUnity, mutation: Mutations::CreateUnityMutation
    field :updateUnity, mutation: Mutations::UpdateUnityMutation
    field :deleteUnity, mutation: Mutations::DeleteUnityMutation

    # product
    field :createProduct, mutation: Mutations::CreateProductMutation
    field :updateProduct, mutation: Mutations::UpdateProductMutation
    field :deleteProduct, mutation: Mutations::DeleteProductMutation

    # order
    field :createOrder, mutation: Mutations::CreateOrderMutation
    field :updateOrder, mutation: Mutations::UpdateOrderMutation

    # order product
    field :createOrderProduct, mutation: Mutations::CreateOrderProductMutation
    field :updateOrderProduct, mutation: Mutations::UpdateOrderProductMutation
    field :deleteOrderProduct, mutation: Mutations::DeleteOrderProductMutation
  end
end
