require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:addresses).dependent(:destroy) }
  it { is_expected.to have_many(:orders).dependent(:restrict_with_error) }

  context 'when after create' do
    it 'have customer as default role' do
      user = create(:user)

      expect(user).to have_role(:customer)
    end
  end
end
