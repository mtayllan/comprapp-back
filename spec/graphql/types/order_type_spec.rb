require 'rails_helper'

RSpec.describe Types::OrderType, type: :object do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:status).of_type('String!') }
  it { is_expected.to have_field(:user).of_type('User!') }
  it { is_expected.to have_field(:orderProducts).of_type('[OrderProduct!]!') }
  it { is_expected.to have_field(:price).of_type('String!') }
end
