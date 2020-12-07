class CandyShopsCandiesController < ApplicationController

  def index
    @candies_by_shop = Candy.all.select do |candy|
      candy.candy_shop_id == params[:id].to_i
    end
  end

  def new
    
  end
end
