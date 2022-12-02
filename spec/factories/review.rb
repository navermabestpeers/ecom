require 'faker'

FactoryBot.define do
  factory :review do |f|
    f.rating { Faker::Name.name }
    f.comment { Faker::Lorem.sentence }
    f.user_id { Faker::Number.digit }
    f.product_id { Faker::Number.digit }
  end
end