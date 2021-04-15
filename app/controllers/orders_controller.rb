class OrdersController < ApplicationController

  def new
    # orders = order_params
  end

  def create
    Order.transaction do
      order_params[:order].each do |param|
        # 注文個数が1個以上ならば注文データを作成する
        current_user.orders.create!(param) if param[:quantity].to_i > 0 
        
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
    params.permit(order: [:product_id, :quantity)
  end
end
