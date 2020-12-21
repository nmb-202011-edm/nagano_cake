class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def confirm
    # binding.pry
    @order = Order.new(order_params)
    @customer = current_customer
    @address = Address.find(params[:order][:id])

    @order.payment_method = params[:order][:payment_method]
    # address_choiceボタンが"〇〇"に選ばれたときというif文
    if params[:order][:address_choice] == "my_address"
      @order.postal_code = @customer.postal_code
      @order.name = @customer.last_name + @customer.first_name
      @order.address = @customer.address
    elsif params[:order][:address_choice] == "addresses"
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address
    elsif params[:order][:address_choice] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
    end
  end

  def complete
  end

  def create
    order.save
    address.save
  end

  def index
  end

  def show
  end

  private

    def order_params
      params.require(:order).permit(:postal_code, :name, :address)
    end
end
