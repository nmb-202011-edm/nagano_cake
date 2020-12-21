class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    # @addresses = @customer.addresses
    @addresses = Address.all
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
