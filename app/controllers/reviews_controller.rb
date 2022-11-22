class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.create!(review_params) 
    redirect_to product_path(@product)
  end  

  private


  def review_params
    params.require(:review).permit(:rating, :comment, :product_id, :user_id)
  end  
end
