class Public::FavoritesController < ApplicationController
  
  def create
    item = Item.find(params[:item_id])
    favorite = current_customer.favorite.new(item_id: item.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    item = Item.find(params[:item_id])
    favorite = current_customer.favorite.find_by(item_id: item.id)
    favorite.destroy
    redirect_to request.referer
  end
end
