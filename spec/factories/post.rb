FactoryBot.define do
  factory :post do
    post_image_id { '' }
    maintext { Faker::Lorem.characters(number: 50) }
    user
  end
end