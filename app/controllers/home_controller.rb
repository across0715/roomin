class HomeController < ApplicationController
  def index
    @room_products = Product.where(category: "room")
    @bath_products = Product.where(category: "bath")
    @counter_products = Product.where(category: "counter")
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
