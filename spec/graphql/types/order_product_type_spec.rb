require 'rails_helper'

RSpec.describe Types::OrderProductType, type: :object do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:amount).of_type('Float!') }
  it { is_expected.to have_field(:priceCents).of_type('Int!') }
  it { is_expected.to have_field(:price).of_type('String!') }
  it { is_expected.to have_field(:product).of_type('Product!') }
end
