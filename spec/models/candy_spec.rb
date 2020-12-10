require 'rails_helper'

describe Candy, type: :model do
  describe 'relationship' do
    it {should belong_to :candy_shop}
  end
describe "class methods" do
  describe "::list_by_most_recent" do
    it "can see the most recent Candy record first and it's datetime" do
      shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
      candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")
      candy_2 = Candy.create!(name: "Fudge", quantity: 0, in_stock: false, candy_shop_id: "#{shop_1.id}")
      candy_3 = Candy.create!(name: "Gobstoppers", quantity: 7, in_stock: true, candy_shop_id: "#{shop_1.id}")

      expect(Candy.list_by_most_recent).to eq([candy_3, candy_2, candy_1])
    end
  end
  describe "::true_first" do
    it "can list in_stock true candies first" do
      shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
      candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")
      candy_2 = Candy.create!(name: "Fudge", quantity: 0, in_stock: false, candy_shop_id: "#{shop_1.id}")
      candy_3 = Candy.create!(name: "Gobstoppers", quantity: 7, in_stock: true, candy_shop_id: "#{shop_1.id}")

      expect(Candy.true_first).to eq([candy_1, candy_3, candy_2])
    end
  end
end
end
