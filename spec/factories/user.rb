require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Lorem.sentence }
    f.phone { 50.0 }
  end
end
