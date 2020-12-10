class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :stores, :distribution_centers_id, :distribution_center_id
  end
end
