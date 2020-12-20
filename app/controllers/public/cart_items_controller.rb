class Public::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart_item, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
  end
  
  
  private

  def params_cart_item
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
