require 'rails_helper'

RSpec.describe OrderStatusHistoric, type: :model do
  it { is_expected.to define_enum_for(:status).with_values(creating: 0, pending: 1, en_route: 2, delivered: 3, canceled: 4) }
  it { is_expected.to belong_to(:order) }
  it { is_expected.to validate_presence_of(:status) }
end
