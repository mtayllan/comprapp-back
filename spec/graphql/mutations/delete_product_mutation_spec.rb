require 'rails_helper'

RSpec.describe Mutations::DeleteProductMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    context 'when the user exists' do
      it 'remove product from database' do
        admin = create(:user, :admin)
        product = create(:product)
        params = { id: product.id }

        perform(admin, params)

        expect(Product.find_by(id: product.id)).to be_nil
      end
    end

    context 'when the product do not exists' do
      it 'returns not found' do
        admin = create(:user, :admin)
        params = { id: 10_000 }

        result = perform(admin, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not delete product' do
      user = create(:user)
      params = { id: create(:product).id }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
