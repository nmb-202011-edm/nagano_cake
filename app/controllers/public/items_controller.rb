class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: 'true')
  end
  
  def show
    
  end
end
