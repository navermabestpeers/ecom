class Order < ApplicationRecord
	has_many :lineitems
	before_save :set_subtotal

	def subtotal
		lineitems.collect {|lineitem| lineitem.valid? ? (lineitem.unit_price*lineitem.quantity) : 0}.sum
	end

	private
		def set_subtotal
			self[:subtotal] = subtotal
		end
end

