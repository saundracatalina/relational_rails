class AddDistributionCentersToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :distribution_centers, foreign_key: true
  end
end
