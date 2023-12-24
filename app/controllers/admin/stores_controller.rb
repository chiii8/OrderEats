class Admin::StoresController < ApplicationController
  
  def index
    @stores = Store.page(params[:page])
  end
  
  def show
    @store = Store.find(params[:id])
  end
  
  private
  
  def store_params
    params.require(:store).permit(:email, :encrypted_password, :name, :address, :telephone_number)
  end
end
