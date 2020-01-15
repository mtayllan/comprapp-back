require 'rails_helper'

RSpec.describe Types::AddressType, type: :object do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:street).of_type('String') }
  it { is_expected.to have_field(:district).of_type('String') }
  it { is_expected.to have_field(:number).of_type('String') }
  it { is_expected.to have_field(:complement).of_type('String') }
  it { is_expected.to have_field(:city).of_type('String') }
  it { is_expected.to have_field(:user).of_type('User') }
end
