FactoryBot.define do
  factory :user do
    user_name {"yamada"}
    password {"zxcvbnm"}
    password_confirmation {"zxcvbnm"}
    sequence(:email) {Faker::Internet.email}
  end
end