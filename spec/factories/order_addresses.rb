FactoryBot.define do
  factory :order_address do
    postal_code           { '123-4567' }
    prefecture_id         { Faker::Number.between(from: 2, to: 47) }
    city                  { 'Test City' }
    address               { 'Test Address' }
    building_name         { 'Test Building' }
    phone_number          { '09012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
