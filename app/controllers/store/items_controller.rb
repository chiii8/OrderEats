class Store::ItemsController < ApplicationController
  before_action :authenticate_store!
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # @item.store_id = @current_store.id
    if @item.save
      redirect_to store_restaurant_items_path(@item.id)
    else
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end
end
