require 'rails_helper'

RSpec.describe Mutations::UpdateOrderMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    context 'when the params are valid' do
      it 'returns the updated order informations' do
        admin = create(:user, :admin)
        order = create(:order)
        params = { id: order.id, status: 'delivered' }

        result = perform(admin, params)

        expect(result[:order].status).to eq('delivered')
      end
    end

    context 'when the params are invalid' do
      it 'returns errors details' do
        admin = create(:user, :admin)
        order = create(:order)
        params = { id: order.id, status: '' }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end

    context 'when the order does not exist' do
      it 'returns not found' do
        admin = create(:user, :admin)
        params = { id: 10_000, status: 'delivered' }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not update another user' do
      user = create(:user)
      params = { id: create(:user).id, status: 'delivered' }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
