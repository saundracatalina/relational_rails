class DistributionCentersController < ApplicationController
  def index
    # truck_filter = session[:tmp_checked]
    # session[:tmp_checked] = nil
    # if truck_filter != nil
    #   @distribution_centers = DistributionCenter.filtered_trucks(truck_filter)
    # else
      @distribution_centers = DistributionCenter.all
    # end
  end

  def show
    @distribution_center = DistributionCenter.find(params[:id])
  end

  def new
  end

  def create
    dc = DistributionCenter.create!({
      name: params[:name],
      trucks_deployed: params[:trucks_deployed]
      })
      
      dc.save
      
    redirect_to '/distribution_centers'
  end

  def edit
    @distribution_center = DistributionCenter.find(params[:id])
  end

  def update
    dc = DistributionCenter.find(params[:id])

    dc.update({
      name: params[:name],
      trucks_deployed: params[:trucks_deployed]
    })

    dc.save

    redirect_to "/distribution_centers/#{dc.id}"
  end

  def destroy
    DistributionCenter.destroy(params[:id])
    redirect_to "/distribution_centers"
  end

  def trucks
    session[:tmp_checked] = params[:truck_filter]
    require 'pry'; binding.pry
    redirect_to distribution_centers_path
  end

end