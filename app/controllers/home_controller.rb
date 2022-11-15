class HomeController < ApplicationController
  def index
    @products = Product.all
    @lineitem = current_order.lineitems.new
    #@reviews = Review.find_by(product_id: @product)
    @reviews = Review.where(product_id: @product).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end
end
