require 'rails_helper'

RSpec.describe Types::OrderStatusHistoricType, type: :object do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:status).of_type('String!') }
  it { is_expected.to have_field(:createdAt).of_type('ISO8601DateTime!') }
end
