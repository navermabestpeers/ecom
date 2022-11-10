class Product < ApplicationRecord
  has_many :lineitems
  belongs_to :user
end
