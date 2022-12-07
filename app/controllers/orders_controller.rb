class OrdersController < ApplicationController
  def index
    @orders = current_user.orders  
    if current_user.has_role? :seller
      @orders = Order.all
    end
  end

  def show
    @order = Order.all
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancelled!
    redirect_to orders_path
  end

  def shipped
    @order = Order.find(params[:id])
    @order.shipped!
    redirect_to orders_path
  end

  def being_packed
    @order = Order.find(params[:id])
    @order.being_packed!
    redirect_to orders_path
  end

  def complete
    @order = Order.find(params[:id])
    @order.complete!
    redirect_to orders_path
  end

  private

  def payments_params
    params.require(:order).permit(:status)
  end
end
