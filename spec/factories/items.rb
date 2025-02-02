FactoryBot.define do
  factory :item do
    name            { Faker::Commerce.product_name }
    description     { Faker::Lorem.sentence }
    category_id     { Faker::Number.between(from: 2, to: 10) }
    condition_id    { Faker::Number.between(from: 2, to: 5) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id   { Faker::Number.between(from: 2, to: 47) }
    ship_day_id     { Faker::Number.between(from: 2, to: 3) }
    price           { Faker::Number.between(from: 300, to: 10000) }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
