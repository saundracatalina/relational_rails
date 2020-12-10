class DistributionCentersStoresController < ApplicationController
  def index
    @stores = Store.stores_by_dc(params)
  end

  def new
  end

  def create
    is_open = (params[:open].upcase == "Y")
  
    store = Store.create!({name: params[:name],
      shipments_received: params[:shipments_received],
      open: is_open,
      distribution_center_id: params[:id]
      })
      redirect_to "/distribution_centers/#{store.distribution_center_id}/stores"
    end
end