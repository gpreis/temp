class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new create_params

    return redirect_to products_path if @product.save

    render :new
  end

  def destroy
    Product.destroy params[:id]

    redirect_to products_path
  end

  private
    def create_params
      params.require(:product).permit :name, :product_category_id
    end
end
