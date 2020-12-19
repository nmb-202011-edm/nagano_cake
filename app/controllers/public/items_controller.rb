class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)
    
    if params[:genre_id].blank?
  		@items = Item.where(is_active: true)
    else
  	  @genre = Genre.find(params[:genre_id])
  		@items = @genre.items.where(is_active: true)
    end
  end
  
  def show
    @genres = Genre.where(is_active: true)
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
  
end
