require 'rails_helper'

RSpec.describe Types::UserType, type: :object do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:name).of_type('String!') }
  it { is_expected.to have_field(:email).of_type('String!') }
  it { is_expected.to have_field(:roles).of_type('[Role!]') }
  it { is_expected.to have_field(:addresses).of_type('[Address!]') }
end
