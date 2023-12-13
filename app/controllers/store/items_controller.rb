class Store::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
end
