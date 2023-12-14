class Store::StoresController < ApplicationController
  
  private
  
  def store_params
    params.require(:store).permit(:email, :password, :telephone_number, :image)
  end
end
