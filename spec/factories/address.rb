require 'faker'

FactoryBot.define do
  factory :address do |f|
    f.address_1 { Faker::Address.street_address }
    f.address_2 { Faker::Address.street_address }
    f.city { Faker::Address.city }
    f.state { "IND" }
    f.country { Faker::Address.country }
    f.postal_code { '452010' }
    f.user_id { Faker::Number.digit }
  end
end
