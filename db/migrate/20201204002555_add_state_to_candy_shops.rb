class AddStateToCandyShops < ActiveRecord::Migration[5.2]
  def change
    add_column :candy_shops, :state, :string
  end
end
