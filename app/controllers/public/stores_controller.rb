class Public::StoresController < ApplicationController
  
  def index
    @stores = Store.page(params[:page])
  end
  
  def show
    @store = Store.find(params[:id])
  end
  
  private
  
  def store_params
    params.require(:store).permit(:name, :telephone_number, :address, :email, :image)
  end
end
