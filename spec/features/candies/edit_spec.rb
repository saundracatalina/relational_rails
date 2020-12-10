require 'rails_helper'

describe "when I visit a specific Candy's edit page" do
  it "can see a form to edit the Candy's attributes" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit "/candies/#{candy_1.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_content("Name")
    expect(page).to have_field("Quantity")
    expect(page).to have_content("Quantity")
    expect(page).to have_button("Update Candy")
  end
describe "when I fill in the form and click the Update Candy button" do
  it "redirects to the show page where the updated info is" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit "/candies/#{candy_1.id}/edit"

    fill_in "Name", with: "Gobstoppers"
    fill_in "Quantity", with: 9

    click_on "Update Candy"

    expect(current_path).to eq("/candies/#{candy_1.id}")
    expect(page).to have_content("Gobstoppers")
    expect(page).to have_content("Quantity: 9")
    expect(page).to have_content("In Stock: true")
  end
end
end
