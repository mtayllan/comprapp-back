require 'rails_helper'

RSpec.describe Mutations::DeleteUnityMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    context 'when the user exists' do
      it 'remove unity from database' do
        admin = create(:user, :admin)
        unity = create(:unity)
        params = { id: unity.id }

        perform(admin, params)

        expect(Unity.find_by(id: unity.id)).to be_nil
      end
    end

    context 'when the unity do not exists' do
      it 'returns not found' do
        admin = create(:user, :admin)
        params = { id: 10_000 }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not delete unity' do
      user = create(:user)
      params = { id: create(:unity).id }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
