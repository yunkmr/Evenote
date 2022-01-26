FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 10) }
    quantity { 2 }
    price { 3500 }
  end
end