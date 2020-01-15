require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:district) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:city) }
end
