class Payment < ApplicationRecord
  belongs_to :order

  validates :payment_mode, presence: true
  validates :order_id, presence: true
end
