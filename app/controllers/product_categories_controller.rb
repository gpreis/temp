class ProductCategoriesController < ApplicationController
  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.find_or_create_by create_params

    if @product_category.valid?
      redirect_to product_categories_path
    else
      render :new
    end
  end

  def destroy
    ProductCategory.destroy params[:id]

    redirect_to product_categories_path
  end

  private
    def create_params
      params.require(:product_category).permit :name
    end
end
