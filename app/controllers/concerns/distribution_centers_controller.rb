class DistributionCentersController < ApplicationController
  def index
    @distribution_centers = DistributionCenter.all
  end
end