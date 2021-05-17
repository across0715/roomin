class OrdersController < ApplicationController
  def index
  end

  def new
    # orders = order_params
  end

  def create
    messages = []
    Order.transaction do
      order_params[:order].each do |param|
        # 注文個数が1個以上ならば注文データを作成する
        if param[:quantity].to_i > 0
          current_user.orders.create!(param)
          product = Product.find(param[:product_id])
          messages << "#{product.name}: #{param[:quantity]}"
        end
        new_order = Order.order(created_at: :desc).first

        flash[:notice] = "#{messages.join(", ")} 注文しました。"
        flash[:notice] = "#{messages.join(", ")} #{t(:order_msg)}"
      end
    end
    redirect_to root_path
  end

  # def create
  #   # binding.pry
  #   Order.transaction do
  #     order_params[:order].each do |param|

  #       # 注文個数が1個以上ならば注文データを作成する
  #       current_user.orders.create!(param) if param[:quantity].to_i > 0
  #       new_order = Order.order(created_at: :desc).first

  #       flash[:notice] = "#{new_order[:id]}を#{new_order[:quantity]}注文しました"
  #     end
  #   end
  #   redirect_to root_path

  # flash[:success]="成功しました"
  # @orders = Order.new(order_params)
  # if @orders.save
  #   redirect_to orders_path notice: "#"
  # else
  #   render :root
  # end
  # end

  private

  def order_params
    params.permit(order: [:product_id, :quantity])
  end
end
