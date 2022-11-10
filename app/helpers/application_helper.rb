module ApplicationHelper

  def current_order    
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new      
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
