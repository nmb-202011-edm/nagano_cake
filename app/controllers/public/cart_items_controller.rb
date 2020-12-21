class Public::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
    @customer = Customer.find(current_customer.id)
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

    # カート内に同商品が重複しないよう商品の数量を合算
    @update_cart_item =  CartItem.find_by(item: @cart_item.item)
    if @update_cart_item.present? && @cart_item.valid?
        @cart_item.amount += @update_cart_item.amount
        @update_cart_item.destroy
    end

    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to cart_items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください"
      render ("customer/items/show")
    end
  end

  def update
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    flash[:success] = "#{@cart_item.item.name}の数量を変更しました"
    @price = sub_price(@cart_item).to_s(:delimited)
    @cart_items = current_cart
    @total = total_price(@cart_items).to_s(:delimited)
    @customer = Customer.find(current_customer.id)
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
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
