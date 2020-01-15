require 'rails_helper'
require 'money-rails/test_helpers'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to(:unity) }
  it { is_expected.to monetize(:price_cents) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:price_cents) }
  it { is_expected.to validate_presence_of(:stock) }
end
