class CandyShopsController < ApplicationController
  def index
    @candy_shops = CandyShop.all
  end

  def show
    @candy_shop = CandyShop.find(params[:id])
  end

  def new
    @candy_shop = CandyShop.new
    # (params[:candy_shop])
  end

  
end
