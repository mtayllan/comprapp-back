FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name  }
    description { Faker::Lorem.paragraph }
    stock { Faker::Number.digit }
    price_cents { Faker::Number.number(digits: 4) }
    unity
  end
end
