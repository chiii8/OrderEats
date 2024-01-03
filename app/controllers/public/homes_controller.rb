class Public::HomesController < ApplicationController
  
  def top
    @stores = Store.page(params[:page])
  end
end
