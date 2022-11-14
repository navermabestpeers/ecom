class PaymentsController < ApplicationController

  def show
    @orders = current_user.orders
  end
  
  def new
    @payment =  Payment.new
  end

  def create
   @payment =  Payment.new(payments_params)
    if @payment.save
      redirect_to @payment
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
    def payments_params
      params.require(:payment).permit(:payment_mode).merge(order_id: current_order.id)
    end
end
