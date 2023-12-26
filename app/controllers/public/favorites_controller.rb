class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    store = Store.find(params[:store_id])
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.new(item_id: item.id, store_id: store.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    store = Store.find(params[:store_id])
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.find_by(item_id: item.id, store_id: store.id)
    favorite.destroy
    redirect_to request.referer
  end
end
