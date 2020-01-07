module Types
  class QueryType < Types::BaseObject
    field :admins,
          [Types::AdminType],
          null: false,
          description: 'Returns a list of admins in the martian library'

    def admins
      Admin.all
    end
  end
end
