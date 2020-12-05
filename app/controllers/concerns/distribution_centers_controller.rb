class DistributionCentersController < ApplicationController
  def index
    @distribution_centers = DistributionCenter.all
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
end