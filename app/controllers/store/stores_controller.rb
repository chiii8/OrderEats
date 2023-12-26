class Store::StoresController < ApplicationController
  
  def show
    @store = Store.find(params[:id])
  end
  
  def edit
    @store = Store.find(params[:id])
  end
  
  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to store_store_path(@store)
    else
      render :edit
    end
  end
  private
  
  def store_params
    params.require(:store).permit(:email, :password, :telephone_number, :image, :name, :address)
  end
end
