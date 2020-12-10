class CandiesController < ApplicationController

  def index
    @candies = Candy.true_first.list_by_most_recent
  end

  def show
    @candy = Candy.find(params[:id])
  end

  def edit
    @candy = Candy.find(params[:id])
  end

  def update
    @candy = Candy.find(params[:id])

    in_stock = (params[:quantity].to_i > 0)

    @candy.update!({
                name: params[:name],
                quantity: params[:quantity],
                in_stock: in_stock
                })
    @candy.save

    redirect_to "/candies/#{@candy.id}"
  end

  def destroy
    Candy.destroy(params[:id])
    redirect_to "/candies"
  end
end
