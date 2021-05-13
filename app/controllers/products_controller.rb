class ProductsController < ApplicationController
  def index
  end

  private

  def product_params
    params.require(:product).permit(:category, :name, :image, :avalable, :name_ja, :name_fr_FR, :name_zh_CN, :name_th)
  end
end
