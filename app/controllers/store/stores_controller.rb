class Store::StoresController < ApplicationController
  
  def show
    @store = current_store
  end
  
  def edit
    @store = current_store
  end
  
  private
  
  def store_params
    params.require(:store).permit(:email, :password, :telephone_number, :image)
  end
end
