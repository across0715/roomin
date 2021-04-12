class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @room_products = Product.where(category: "in_room")
    @bath_products = Product.where(category: "in_bath")
    @counter_products = Product.where(category: "at_counter")
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
