require 'rails_helper'

RSpec.describe Unity, type: :model do
  it { is_expected.to have_many(:products).dependent(:restrict_with_error) }
  it { is_expected.to validate_presence_of(:name) }
end
