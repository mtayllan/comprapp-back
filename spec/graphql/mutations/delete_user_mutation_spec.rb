require 'rails_helper'

RSpec.describe Mutations::DeleteUserMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    context 'when the user exists' do
      it 'remove user from database' do
        admin = create(:user, :admin)
        user = create(:user)
        params = { id: user.id }

        perform(admin, params)

        expect(User.find_by(id: user.id)).to be_nil
      end
    end

    context 'when the user not exists' do
      it 'returns not found' do
        admin = create(:user, :admin)
        params = { id: 10_000 }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not delete another user' do
      user = create(:user)
      params = { id: create(:user).id }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
