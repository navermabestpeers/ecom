require 'faker'

FactoryBot.define do
  factory :product do |f|
    f.title { Faker::Name.name }
    f.description { Faker::Lorem.sentence }
    f.price {50.0}
    f.user_id { Faker::Number.digit }
  end
end