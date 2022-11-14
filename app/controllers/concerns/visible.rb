module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['cart', 'payment', 'delivery', 'shipped', 'canceled']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'cart').count
    end
  end
end