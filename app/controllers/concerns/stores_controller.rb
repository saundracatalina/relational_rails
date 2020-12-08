class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
  end

  def update
    @store = Store.update({
                          name: params[:name],
                          shipments_received: params[:shipments_received],
                          open: params[:open]
                          })

    redirect_to store_show_path
  end

  def destroy
    Store.destroy(params[:id])
    redirect_to stores_path
  end
end