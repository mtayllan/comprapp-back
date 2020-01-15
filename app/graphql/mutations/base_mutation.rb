module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    def verify_admin_authorization
      context[:current_user].has_role?(:admin)
    end

    def unauthorized
      { errors: ['Not Authorized'] }
    end

    def not_found
      { errors: ['Not Found'] }
    end
  end
end
