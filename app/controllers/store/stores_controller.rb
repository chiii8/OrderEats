class Store::StoresController < ApplicationController
  
  def show
    @store = Store.find(params[:id])
  end
  
  def edit
    @store = Store.find(params[:id])
  end
  
  private
  
  def store_params
    params.require(:store).permit(:email, :password, :telephone_number, :image)
  end
end
