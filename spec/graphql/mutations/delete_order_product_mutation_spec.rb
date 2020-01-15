require 'rails_helper'

RSpec.describe Mutations::DeleteOrderProductMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the order belongs to the authenticated user' do
    it 'delete the order product' do
      user = create(:user)
      order = create(:order, user: user)
      order_product = create(:order_product, order: order)

      perform(user, id: order_product.id, order_id: order.id)

      expect(OrderProduct.find_by(id: order_product.id)).to be_nil
    end
  end

  context 'when the order do not belongs to the authenticated user' do
    it 'returns not found' do
      user = create(:user)
      order = create(:order)
      order_product = create(:order_product, order: order)

      result = perform(user, id: order_product.id, order_id: order.id)

      expect(result[:errors]).not_to be_nil
    end
  end

  context 'when the order product does not exist' do
    it 'return not found' do
      user = create(:user)
      order = create(:order, user: user)
      params = { id: 10_000, order_id: order.id }

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
