FactoryBot.define do
  factory :album do
    album_name { Faker::Lorem.characters(number: 10) }
  end
end