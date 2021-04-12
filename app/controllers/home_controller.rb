class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @room_products = Product.where(category: 1)
    @bath_products = Product.where(category: 2)
    @counter_products = Product.where(category: 3)
  end

  def new
  end

  def create
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :room_number, :password)
  end
end
