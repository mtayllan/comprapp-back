require 'rails_helper'

RSpec.describe Mutations::UpdateOrderProductMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when params are valid' do
    it 'update the product in the order' do
      user = create(:user)
      order = create(:order, :with_products, user: user)
      new_amount = Faker::Number.positive

      result = perform(user, amount: new_amount, id: order.order_products.first.id, order_id: order.id)

      expect(result[:orderProduct][:amount]).to eq(new_amount)
    end
  end

  context 'when the params are invalid' do
    it 'return errors' do
      user = create(:user)
      order = create(:order, :with_products, user: user)
      new_amount = -1

      result = perform(user, amount: new_amount, id: order.order_products.first.id, order_id: order.id)

      expect(result[:errors]).not_to be_nil
    end
  end

  context 'when the order do not belongs to the user' do
    it 'return unauthorized' do
      user = create(:user)
      order = create(:order, :with_products)

      result = perform(user, id: order.order_products.first.id, amount: 1, order_id: order.id)

      expect(result[:errors]).not_to be_nil
    end
  end
end
