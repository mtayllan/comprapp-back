module Types
  class OrderStatusHistoricType < Types::BaseObject
    field :id, ID, null: false
    field :status, String, null: false
    field :createdAt, GraphQL::Types::ISO8601DateTime, null: false
  end
end
