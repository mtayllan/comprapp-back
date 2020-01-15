require 'rails_helper'

RSpec.describe Mutations::CreateProductMutation, type: :mutation do
  def perform(user, args = {})
    described_class.new(object: nil, context: { current_user: user }, field: nil).resolve(args)
  end

  context 'when the user is an admin' do
    it 'can create the product' do
      user = create(:user, :admin)
      params = attributes_for(:product, unity_id: create(:unity).id)

      result = perform(user, params)

      expect(result[:product][:name]).to eq(params[:name])
    end

    context 'when the params are invalid' do
      it 'returns errors' do
        user = create(:user, :admin)
        params = attributes_for(:product)

        result = perform(user, params)

        expect(result[:errors]).not_to be_nil
      end
    end
  end

  context 'when the user is not an admin' do
    it 'can not create product' do
      user = create(:user)
      params = attributes_for(:product)

      result = perform(user, params)

      expect(result[:errors]).not_to be_nil
    end
  end
end
