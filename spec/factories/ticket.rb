FactoryBot.define do
  factory :ticket do
    event_name { Faker::Lorem.characters(number: 10) }
    event_date { '2022-03-01 00:00:00' }
    number { 5 }
    money { 1000 }
    entry_start_date { '2022-02-01 00:00:00' }
    entry_end_date { '2022-02-05 00:00:00' }
    entry_flg { true }
    win_date { '2022-02-10 00:00:00' }
    win_flg { '' }
    payment_date { '2022-02-15 00:00:00' }
    payment_flg { false }
    user
  end
end