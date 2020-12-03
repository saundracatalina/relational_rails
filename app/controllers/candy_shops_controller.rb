class CandyShopsController < ApplicationController
  def index
    @candy_shops = CandyShop.all
  end
end
