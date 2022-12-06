require 'faker'

FactoryBot.define do
  factory :lineitem do |f|
    f.total_price { 50.0 }
    f.quantity { 1 }
    f.unit_price {50.0}
    f.product_id { Faker::Number.digit }
    f.order_id { Faker::Number.digit }
  end
end