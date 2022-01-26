FactoryBot.define do
  factory :event do
    name { Faker::Lorem.characters(number: 10) }
    date { '2022-03-01 00:00:00' }
    open_time { '16:00:00' }
    start_time { '18:00:00' }
    end_time { '20:00:00' }
    artist { Faker::Lorem.characters(number: 20) }
    place { Faker::Lorem.characters(number: 20) }
    seat { Faker::Lorem.characters(number: 20) }
    with { Faker::Lorem.characters(number: 20) }
    memo { Faker::Lorem.characters(number: 20) }
    release_flg { false }
    user
  end
end