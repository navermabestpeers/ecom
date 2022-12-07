module ApplicationHelper

  def current_order    
    if user_signed_in?
      @order = current_user.orders.last
      if @order.nil?
        @order = Order.new
      elsif @order.status == "processing"
        @order
      else
        Order.new      
      end
    elsif !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
