class LineitemsController < ApplicationController
  def create
    @order = current_order
    @lineitem = @order.lineitems.new(lineitem_params)
    @order.save
    current_user.orders << @order
    session[:order_id] = @order.id
  end
  
  def update
    @order = current_order
    @lineitem = @order.lineitems.find(params[:id])
    @lineitem.update(lineitem_params)
    @lineitems = @order.lineitems
  end

  def destroy
    @order = current_order
    @lineitem = @order.lineitems.find(params[:id])
    @lineitem.destroy
    @lineitems = @order.lineitems
  end

  private
  
  def lineitem_params
    params.require(:lineitem).permit(:product_id, :quantity, :user_id)      
  end
end
