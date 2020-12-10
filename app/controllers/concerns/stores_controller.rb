class StoresController < ApplicationController
  def index
    @stores = Store.true_first.list_by_most_recent
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
  end

  def update
    store = Store.find(params[:id])

    store.update({
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