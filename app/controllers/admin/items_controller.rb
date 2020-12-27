class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
    # ↓is_activeがtrueなGenreを持ってくる↓
    @genres = Genre.where(is_active: 'true')
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      @genres = Genre.where(is_active: 'true')
      render "new"
    end
  end
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.where(is_active: 'true')
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "edit"
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
  
end
