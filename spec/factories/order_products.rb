FactoryBot.define do
  factory :order_product do
    order
    product
    amount { Faker::Number.positive }
  end
end
