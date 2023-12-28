class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def favorites
    @customer = current_customer
    favorites = Favorite.where(customer_id: @customer.id).pluck(:store_id)
    @favorite_stores = Store.find(favorites)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :is_active, :email, :profile_image, :gender)
  end
end
