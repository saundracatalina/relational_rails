require 'rails_helper'

describe "when I visit a specific Candy's show page" do
  it "has the candy with that id and it's attributes" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit "/candies/#{candy_1.id}"

    expect(page).to have_content("Taffy")
    expect(page).to have_content("5")
    expect(page).to have_content("true")
    expect(page).to have_content("#{candy_1.id}")
  end
  it "has a link to Update Candy and when clicked redirects to edit page" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit "/candies/#{candy_1.id}"

    expect(page).to have_link("Update Candy")

    click_on "Update Candy"

    expect(current_path).to eq("/candies/#{candy_1.id}/edit")
  end
  it "has a button to Delete Candy and when clicked redirects to candy index and is no longer listed" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit "/candies/#{candy_1.id}"

    expect(page).to have_button("Delete Candy")

    click_on "Delete Candy"

    expect(current_path).to eq("/candies")

    expect(page).to have_no_content("Taffy")
    expect(page).to have_no_content("Quantity: 5")
    expect(page).to have_no_content("In Stock: true")
    expect(page).to have_no_content("Candy Shop Id: #{shop_1.id}")
  end
end
