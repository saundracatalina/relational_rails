class AddCandyShopToCandies < ActiveRecord::Migration[5.2]
  def change
    add_reference :candies, :candy_shop, foreign_key: true
  end
end
