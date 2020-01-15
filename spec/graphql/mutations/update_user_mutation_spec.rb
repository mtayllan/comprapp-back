require 'rails_helper'

RSpec.describe Mutations::UpdateUserMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    context 'when the params are valid' do
      it 'returns the updated user informations' do
        admin = create(:user, :admin)
        user = create(:user)
        params = { id: user.id, name: 'new name' }

        result = perform(admin, params)

        expect(result[:user].name).to eq('new name')
      end
    end

    context 'when the params are invalid' do
      it 'returns errors details' do
        admin = create(:user, :admin)
        user = create(:user)
        params = { id: user.id, password: '123' }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end

    context 'when the user does not exist' do
      it 'returns not found' do
        admin = create(:user, :admin)
        params = { id: 10_000, name: 'new name' }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not update another user' do
      user = create(:user)
      params = { id: create(:user).id, name: 'new name' }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
