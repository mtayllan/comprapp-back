require 'rails_helper'

RSpec.describe Mutations::CreateUserMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    it 'can create another user with admin role' do
      user = create(:user, :admin)
      params = attributes_for(:user, role: 'admin')

      result = perform(user, params)

      expect(result[:user]).to have_role(:admin)
    end

    context 'when the params are invalid' do
      it 'returns errors' do
        user = create(:user, :admin)
        params = attributes_for(:user, password: '123')

        result = perform(user, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not create another user' do
      user = create(:user)
      params = attributes_for(:user)

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
