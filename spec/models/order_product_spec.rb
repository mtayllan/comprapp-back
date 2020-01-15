require 'rails_helper'
require 'money-rails/test_helpers'

RSpec.describe OrderProduct, type: :model do
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:product) }
  it { is_expected.to monetize(:price_cents) }

  context 'when after create' do
    it 'has the same value of the product' do
      order_product = create(:order_product)
      expect(order_product.price).to eq(order_product.product.price)
    end
  end
end
