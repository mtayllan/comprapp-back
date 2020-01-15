require 'rails_helper'

RSpec.describe Mutations::UpdateAddressMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when params are valid' do
    it 'update the address' do
      user = create(:user)
      address = create(:address, user: user)
      params = { id: address.id, street: 'new street' }

      result = perform(user, params)

      expect(result[:address][:street]).to eq('new street')
    end
  end

  context 'when the params are invalid' do
    it 'return errors' do
      user = create(:user)
      address = create(:address, user: user)
      params = { id: address.id, street: '' }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end

  context 'when the address does not exist' do
    it 'return not found' do
      user = create(:user)
      params = { id: 10_000, street: 'new street' }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end

  context 'when the address does not belongs to the user' do
    it 'return not found' do
      user = create(:user)
      address = create(:address)
      params = { id: address.id, street: 'new street' }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
