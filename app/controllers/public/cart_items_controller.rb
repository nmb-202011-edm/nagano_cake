class Public::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: @cart_item.item_id).present?
      @old_cart_item =  current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      @old_cart_item.amount += @cart_item.amount
      @old_cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"

    else
      @cart_item.save
      flash[:alert] = "個数を選択してください"
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
    @cart_items = current_customer.cart_items
    flash[:success] = "#{@cart_item.item.name}の数量を変更しました"
    render :index
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice] = "カート内の商品を削除しました。"
      redirect_to cart_items_path
    else
      render action: :index
    end
  end

  def destroy_all
    customer = Customer.find(current_customer.id)
    if customer.cart_items.destroy_all
      flash[:notice] = "カート内の商品を全て削除しました。"
      redirect_to cart_items_path
    else
      render action: :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end