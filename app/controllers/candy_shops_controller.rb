class CandyShopsController < ApplicationController
  def index
    @candy_shops = CandyShop.all
  end

  def show
    @candy_shop = CandyShop.find(params[:id])
  end

  def new

  end

  def create
    @candy_shop = CandyShop.create!({
                  name: params[:name],
                  state: params[:state]
                  })
    @candy_shop.save
    redirect_to '/candy_shops'
  end

  def edit
    @candy_shop = CandyShop.find(params[:id])
  end

  def update
    @candy_shop = CandyShop.find(params[:id])

    @candy_shop.update!({
                name: params[:name],
                state: params[:state]
                })
    @candy_shop.save
    redirect_to "/candy_shops/#{@candy_shop.id}"
  end
end
