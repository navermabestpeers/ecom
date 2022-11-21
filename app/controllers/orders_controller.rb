class OrdersController < ApplicationController

  def index
    @orders = current_user.orders    
  end

  def show
    
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancelled!
    redirect_to orders_path
  end

  private

  def payments_params
    params.require(:order).permit(:status)
  end
end
