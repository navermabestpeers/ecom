class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :address_1, :address_2, :city, :state, :country, :postal_code, :user_id
end
