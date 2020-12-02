class AddTrucksDeployedToDistributionCenters < ActiveRecord::Migration[5.2]
  def change
    add_column :distribution_centers, :trucks_deployed, :integer
  end
end
