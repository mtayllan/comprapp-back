FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    district { Faker::Address.community }
    number { Faker::Address.building_number  }
    city { Faker::Address.city }
    user
  end
end
