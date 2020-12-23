class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def confirm
    @order = Order.new(order_params)
    @new_order = Order.new
    # binding.pry
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    # address_choiceボタンが"〇〇"に選ばれたときというif文
    if params[:order][:address_choice] == "my_address"
      @order.postal_code = @customer.postal_code
      @order.name = @customer.last_name + @customer.first_name
      @order.address = @customer.address
    elsif params[:order][:address_choice] == "addresses"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address
    elsif params[:order][:address_choice] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
    end
  end

  def create
    # @order = params[:order]
    @new_order = Order.new(order_params)
    @new_order.customer_id = current_customer.id
    # binding.pry
    @customer = current_customer
    @cart_items = @customer.cart_items
    if @new_order.save
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item_id
        @order_item.order_id = @new_order.id
        @order_item.price = cart_item.item.price
        @order_item.amount = cart_item.amount
        @order_item.save
      end
      @cart_items.delete_all
      redirect_to orders_complete_path
    else
      render "new"
    end

  end

  def complete
  end

  def index
    @tax = 1.1
    @total_price = 0
    @orders = current_customer.orders
  end

  def show
    @tax = 1.1
    @total_price = 0
    @order = Order.find(params[:id])
    @order_items = @order.order_items
      @order_items.each do |order_items|
        @sub_total = @tax * order_items.price * order_items.amount
        @total_price += @sub_total
      end
  end

  private

    def order_params
      params.require(:order).permit(:postal_code, :name, :address, :payment_method, :address_choice, :address_id)
    end
end
