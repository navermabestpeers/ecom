class PaymentsController < ApplicationController
 
  def pay
    @payment = current_order
  end
  
  private
    def payments_params
      params.require(:payment).permit(:payment_mode, :order_id)
    end
end
