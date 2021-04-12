class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.order(created_at: :desc)
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
