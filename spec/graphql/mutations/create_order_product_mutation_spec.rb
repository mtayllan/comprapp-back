require 'rails_helper'

RSpec.describe Mutations::CreateOrderProductMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when params are valid' do
    it 'add the product to the order' do
      user = create(:user)
      order = create(:order, user: user)
      params = attributes_for(:order_product, product_id: create(:product).id)

      perform(user, params.merge(order_id: order.id))

      expect(order.products.count).to be(1)
    end
  end

  context 'when the params are invalid' do
    it 'return errors' do
      user = create(:user)
      order = create(:order, user: user)
      params = attributes_for(:order_product, product_id: create(:product).id, amount: -1)

      result = perform(user, params.merge(order_id: order.id))

      expect(result[:errors]).not_to be_nil
    end
  end

  context 'when the order do not belongs to the user' do
    it 'return unauthorized' do
      user = create(:user)
      order = create(:order)
      params = attributes_for(:order_product, product_id: create(:product).id)

      result = perform(user, params.merge(order_id: order.id))

      expect(result[:errors]).not_to be_nil
    end
  end
end
