class Order < ApplicationRecord
	has_many :lineitems, dependent: :destroy
  has_many :payments
	before_save :set_subtotal
  after_create :assign_default_status

  enum status: %i[shipped being_packed complete cancelled]

	def subtotal
		lineitems.collect {|lineitem| lineitem.valid? ? (lineitem.unit_price*lineitem.quantity) : 0}.sum
	end

	private
		def set_subtotal
			self[:subtotal] = subtotal
		end

    def assign_default_status
      self.status = "shipped"
    end
end

