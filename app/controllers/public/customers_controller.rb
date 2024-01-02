class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def mypage
    @customer = current_customer
  end
  
  def confirmation
    @customer = current_customer
  end
  
  def favorites
    @customer = current_customer
    favorites = Favorite.where(customer_id: @customer.id).pluck(:store_id)
    @favorite_stores = Store.find(favorites)
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if params[:id] == "withdraw" # idがwithdrawか否か判別する
      withdraw
    elsif @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to confirmation_path(current_customer)
    else
      render :edit
    end
  end
  
  def withdraw_confirm
  end
  
  def withdraw
    @customer = current_customer
    if @customer.update(is_active: false)
      reset_session
    end
      flash[:notice] = "またのご利用をお待ちしております。"
      redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :is_active, :email, :profile_image, :gender)
  end
end
