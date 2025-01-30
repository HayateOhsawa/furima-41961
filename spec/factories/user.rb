FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'あああ' }
    first_name            { 'あああ' }
    last_kana             { 'アアア' }
    first_kana            { 'アアア' }
    birth_date            { Faker::Date.birthday }
  end
end
