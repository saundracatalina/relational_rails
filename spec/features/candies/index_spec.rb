require 'rails_helper'

describe 'When I visit the Candies index page' do
  it 'can see all Candies in the system and their attributes' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit '/candies'

    expect(page).to have_content("Taffy")
    expect(page).to have_content("5")
    expect(page).to have_content("true")
    expect(page).to have_content("Taffy")
    expect(page).to have_content("#{shop_1.id}")
    expect(page).to have_content("Created On: #{candy_1.created_at.strftime("%m/%d/%y")}")
  end
  it "can list Candies by date with in stock candies first" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")
    candy_2 = Candy.create!(name: "Fudge", quantity: 0, in_stock: false, candy_shop_id: "#{shop_1.id}")
    candy_3 = Candy.create!(name: "Gobstoppers", quantity: 7, in_stock: true, candy_shop_id: "#{shop_1.id}")

    expect(Candy.true_first.list_by_most_recent).to eq([candy_3, candy_1, candy_2])
  end
end
