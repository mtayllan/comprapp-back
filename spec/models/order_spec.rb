require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:order_products).dependent(:destroy) }
  it { is_expected.to have_many(:products).through(:order_products) }
  it { is_expected.to define_enum_for(:status).with_values(creating: 0, pending: 1, en_route: 2, delivered: 3, canceled: 4) }
  it { is_expected.to validate_presence_of(:status) }

  context 'when the order change status' do
    it 'register a new status change' do
      order = create(:order, status: 'pending')
      order.delivered!

      expect(order.order_status_historics.count).to eq(2)
    end
  end
end
