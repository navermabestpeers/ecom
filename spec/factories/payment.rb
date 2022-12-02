require 'faker'

FactoryBot.define do
  factory :payment do |f|
    f.payment_mode { 'COD' }
    f.order_id { Faker::Number.digit }
  end
end