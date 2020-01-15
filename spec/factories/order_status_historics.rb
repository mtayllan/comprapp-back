FactoryBot.define do
  factory :order_status_historic do
    status { OrderStatusHistoric.statuses.keys.sample }
    order
  end
end
