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
end