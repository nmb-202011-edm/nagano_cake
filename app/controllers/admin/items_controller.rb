class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    redirect_back(fallback_location: new_admin_item_path)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private

  def post_params
    params.require(:item).permit(:name, :introduction, :price, :image, genre_ids: [])
  end
  
end
