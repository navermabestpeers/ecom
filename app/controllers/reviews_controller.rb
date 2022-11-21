class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    redirect_to product_path(@product)
  end  

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end  

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
      if @review.update(review_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @product
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to product_path(@product)
    else
      flash[:error] = 'Something went wrong'
      redirect_to product_path(@product)
    end
  end
  

  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end  
end
