class ProductsController < ApplicationController
  def index
    @name_ja = Product.name_ja
    @name_th = Product.name_th
    @name_fr_FR = Product.name_fr_FR
    @name_zh_CN = Product.name_zh_CN
  end

  private

  def product_params
    params.require(:product).permit(:category, :name_en, :image, :avalable, :name_ja, :name_fr_FR, :name_zh_CN, :name_th)
  end
end
