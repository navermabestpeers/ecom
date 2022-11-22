class HomeController < ApplicationController
  def index
    @products = Product.all
    @lineitem = current_order.lineitems.new

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end
  
  # def show
  #   @product = Product.find(params[:id])
  #   @review = Review.new
  # end
  
end
