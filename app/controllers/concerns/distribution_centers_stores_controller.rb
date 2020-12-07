class DistributionCentersStoresController < ApplicationController
  def index
    @stores_by_dc = Store.all.select do |store|
      store.distribution_centers_id == params[:id].to_i
    end
  end
end