class Store::RestaurantsController < ApplicationController
  def store_params
    params.require(:store).permit(:email, :password, :telephone_number)
  end
end
