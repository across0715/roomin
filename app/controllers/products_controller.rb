class ProductsController < ApplicationController
  def index
    @product_name = Product.name
  end

  private

  def product_params
    params.require(:product).permit(:category, :name, :image, :avalable)
  end
end
