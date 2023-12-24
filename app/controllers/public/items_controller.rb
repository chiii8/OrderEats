class Public::ItemsController < ApplicationController
  
  def index
    # @q = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
    @store = Store.find(params[:store_id])
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :store_id)
  end
end
