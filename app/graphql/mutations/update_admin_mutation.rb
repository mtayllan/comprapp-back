module Mutations
  class UpdateAdminMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: true
    argument :password, String, required: false

    field :admin, Types::AdminType, null: true
    field :errors, [String], null: true

    def resolve(id:, email:, password: nil, name: :nil)
      admin = Admin.find(id)
      if admin.update({ email: email, password: password, name: name }.compact)
        { admin: admin }
      else
        { errors: admin.errors }
      end
    end
  end
end
