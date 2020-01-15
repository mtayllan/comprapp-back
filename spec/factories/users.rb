FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }

    trait :admin do
      after(:create) do |user|
        user.add_role(:admin)
      end
    end
  end
end
