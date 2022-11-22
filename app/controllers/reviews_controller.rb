class ReviewsController < ApplicationController
  
  def create
    #@product = Product.find(params[:product_id])
    # @user = User.find(params[:current_user])
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.create!(review_params) 
    redirect_to product_path(@product)
  end  

  # def edit
  #   @product = Product.find(params[:product_id])
  #   @review = @product.reviews.find(params[:id])
  # end  


  private
    def review_params
      params.require(:review).permit(:rating, :comment, :product_id, :user_id)
    end  
end
