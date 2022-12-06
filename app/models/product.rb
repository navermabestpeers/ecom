class Product < ApplicationRecord
  belongs_to :user
  has_many :lineitems
  has_many :reviews

  validates :title, presence: true, length: { in: 2..25 }
  validates :description, presence: true, length: { in: 10..400 }
  validates :price, presence: true
  validates :user_id, presence: true
end
