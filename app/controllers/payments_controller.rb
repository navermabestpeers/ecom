class PaymentsController < ApplicationController
  def show
    @order = current_user.orders.last
  end
  
  def new
    @payment =  Payment.new
  end

  def create
    @payment =  Payment.new(payments_params)
    @order = current_order
    if @payment.save 
      redirect_to @payment    
      session.delete(:order_id)
      @order.shipped!
    end
  end
  
  private
  
    def payments_params
      params.require(:payment).permit(:payment_mode,:order_id)
    end
end
