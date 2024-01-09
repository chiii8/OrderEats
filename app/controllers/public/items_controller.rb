class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  
  def index
    @store = Store.find(params[:store_id])
    @items = Item.where(is_active: 1).page(params[:page]).per(8)
  end
  
  def show
    @store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :store_id)
  end
end
