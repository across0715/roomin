class OrdersController < ApplicationController
  def index

  end
  def new
    # orders = order_params
  end

  def create
    Order.transaction do
      order_params[:order].each do |param|
        # binding.pry
        # 注文個数が1個以上ならば注文データを作成する
        current_user.orders.create!(param) if param[:quantity].to_i > 0
        flash[:notice]="#{current_user.orders.last{param}[:quantity]}を
                        #{current_user.orders.last{param}[:product_id]}個注文しました"
      end
    end
    redirect_to root_path
   
    # flash[:success]="成功しました"
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
