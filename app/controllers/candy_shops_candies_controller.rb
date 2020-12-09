class CandyShopsCandiesController < ApplicationController

  def index
    @candies_by_shop = Candy.all.select do |candy|
      candy.candy_shop_id == params[:id].to_i
    end
  end

  def new

  end

  def create
    in_stock = (params[:quantity].to_i > 0)

    @candy = Candy.create!({name: params[:name],
                  quantity: params[:quantity],
                  in_stock: in_stock,
                  candy_shop_id: params[:id]
                  })

    redirect_to "/candy_shops/#{@candy.candy_shop_id}/candies"
  end
end
