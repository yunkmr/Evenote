FactoryBot.define do
  factory :chat do
    message { Faker::Lorem.characters(number: 100) }
    user
    room
  end
end