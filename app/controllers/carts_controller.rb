class CartsController < ApplicationController
  def show
     # if user_signed_in?
    #   @order = current_user.orders
    #   @order = @order.last
    #   if @order.status == "processing"
    #     @lineitems = @order.lineitems
    #   else
    #     flash[:error] = "No items in the cart"
    #   end
    # else
      @lineitems = current_order.lineitems
    # end
  end
end
