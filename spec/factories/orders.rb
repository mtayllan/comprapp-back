FactoryBot.define do
  factory :order do
    status { Order.statuses.keys.sample }
    user
  end
end
