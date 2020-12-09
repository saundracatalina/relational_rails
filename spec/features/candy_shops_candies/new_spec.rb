require 'rails_helper'

describe 'when I visit the new Candy Shops Candy page' do
  it "can see a form to add a new Candy" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

    visit "/candy_shops/#{shop_1.id}/candies/new"

    expect(page).to have_field("Name")
    expect(page).to have_field("Quantity")

    expect(page).to have_content("Name")
    expect(page).to have_content("Quantity")

    expect(page).to have_button("Create Candy")
  end
  it "can fill in form, click 'Create Candy', and redirect to index to see it listed" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

    visit "/candy_shops/#{shop_1.id}/candies/new"

    fill_in "name", with: "Fudge"
    fill_in "quantity", with: 7

    click_on "Create Candy"

    expect(current_path).to eq("/candy_shops/#{shop_1.id}/candies")
    expect(page).to have_content("Fudge")
    expect(page).to have_content("Quantity: 7")
    expect(page).to have_content("In Stock: true")
  end
end
