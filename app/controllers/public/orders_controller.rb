class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order.fee = 300
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    current_customer.cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.item_id = cart_item.item.id
      @order_details.quantity = cart_item.quantity
      @order_details.payment_amount = cart_item.item.with_tax_price
      @order_details.order_id = @order.id
      @order_details.save
    end
    
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end
  
  def thanks
  end
  
  def possible
  end
  
  private
  
  def order_params
    params.require(:order).permit(:fee, :customer_id, :payment_method, :payment_amount)
  end
end
