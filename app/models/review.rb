class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :comment, presence: true
end
