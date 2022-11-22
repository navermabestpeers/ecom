class HomeController < ApplicationController
  def index
    @products = Product.all
    @lineitem = current_order.lineitems.new
  end  
end
