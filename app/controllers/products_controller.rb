class ProductsController < ApplicationController
  def index
    @products = current_user.products.all
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  private

  def product_params
    params.require(:product).permit(:title, :price, :user_id, :current_user)    
  end
end
