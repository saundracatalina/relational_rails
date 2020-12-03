class DistributionCentersController < ApplicationController
  def index
    @distribution_centers = DistributionCenter.all
  end

  def show
    @distribution_center = DistributionCenter.find(params[:id])
  end
end