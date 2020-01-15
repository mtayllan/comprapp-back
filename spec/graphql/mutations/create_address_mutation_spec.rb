require 'rails_helper'

RSpec.describe Mutations::CreateAddressMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when params are valid' do
    it 'add the address to te authenticated user' do
      user = create(:user)
      params = attributes_for(:address)

      perform(user, params)

      expect(user.addresses.count).to be(1)
    end
  end

  context 'when the params are invalid' do
    it 'return errors' do
      user = create(:user)
      params = attributes_for(:address, street: nil)

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
