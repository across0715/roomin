class OrdersController < ApplicationController
  def Index
  end

  def new
    orders = order_params
  end

  def create
    session["warden.user.user.key"].first.first
    Order.transaction do
      order_params[:order].each do |param|
        current_user.orders.create!(param)
      end
    end
    redirect_to root_path
    # @orders = Order.new(order_params)
    # if @orders.save
    #   redirect_to orders_path notice: "#"
    # else
    #   render :root
    # end
  end

  private

  def order_params
    params.permit(order: [:product_id, :quantity])
  end
end
