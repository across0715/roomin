class ProductsController < ApplicationController
  def index
    @product = Post.order(:id)
  end

  private

  def product_params
    params.require(:product).permit(:category, :name, :image, :avalable)
  end
end
