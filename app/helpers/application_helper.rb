module ApplicationHelper

  def current_order    
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new      
    end    
  end

  def current_line_item    
    if !session[:lineitem_id].nil?
      Lineitem.find(session[:lineitem_id])
    else
      Lineitem.new      
    end    
  end

  def destroy_line_item
        if current_order.status == "shipped"
            reset_session
        end
    
  end

   def current_product    
    if !session[:product_id].nil?
      Product.find(session[:product_id])
    else
      Product.new      
    end    
  end
end
