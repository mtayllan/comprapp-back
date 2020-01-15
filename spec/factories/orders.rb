FactoryBot.define do
  factory :order do
    status { Order.statuses.keys.sample }
    user
    trait :with_products do
      after(:create) do |order|
        create_list(:order_product, 3, order: order)
      end
    end
  end
end
