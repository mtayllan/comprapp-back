require 'rails_helper'

RSpec.describe Types::ProductType, type: :object do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:name).of_type('String!') }
  it { is_expected.to have_field(:description).of_type('String!') }
  it { is_expected.to have_field(:stock).of_type('Float!') }
  it { is_expected.to have_field(:priceCents).of_type('Int!') }
  it { is_expected.to have_field(:price).of_type('String!') }
  it { is_expected.to have_field(:unity).of_type('Unity!') }
end
