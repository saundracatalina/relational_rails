require 'rails_helper'

describe "When I visit a specific Candy Shop's Candies page" do
  it "can see each candy that is associated with that Candy Shop and it's attributes" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    shop_2 = CandyShop.create!(name: "Dentist's Friend", state: "Missouri")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")
    candy_2 = Candy.create!(name: "Fudge", quantity: 0, in_stock: false, candy_shop_id: "#{shop_2.id}")

    visit "/candy_shops/#{shop_1.id}/candies"

    expect(page).to have_content("Taffy")
    expect(page).to have_content("Quantity: 5")
    expect(page).to have_content("true")
    expect(page).to have_content("#{shop_1.id}")

    expect(page).to have_no_content("Fudge")
    expect(page).to have_no_content("Quantity: 0")
    expect(page).to have_no_content("false")
    expect(page).to have_no_content("#{shop_2.id}")
  end
  it "can see a link 'Create Candy' to add a new candy for that Candy Shop and can click link" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

    visit "/candy_shops/#{shop_1.id}/candies"

    expect(page).to have_link("Create Candy")

    click_on "Create Candy"

    expect(current_path).to eq("/candy_shops/#{shop_1.id}/candies/new")
  end
end
