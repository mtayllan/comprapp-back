require 'rails_helper'

RSpec.describe Mutations::DeleteAddressMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the address belongs to the authenticated user' do
    it 'delete the address' do
      user = create(:user)
      address = create(:address, user: user)
      params = { id: address.id }

      perform(user, params)

      expect(Address.find_by(id: address.id)).to be_nil
    end
  end

  context 'when the address do not belongs to the authenticated user' do
    it 'returns not found' do
      user = create(:user)
      address = create(:address)
      params = { id: address.id }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end

  context 'when the address does not exist' do
    it 'return not found' do
      user = create(:user)
      params = { id: 10_000 }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
