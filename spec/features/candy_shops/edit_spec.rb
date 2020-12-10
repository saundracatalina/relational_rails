require 'rails_helper'

describe 'When I fill out the form with updated information and click submit' do
  it 'updates the Candy Shop information and shows the updated info' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

    visit "/candy_shops/#{shop_1.id}/edit"

    fill_in "name", with: "Lollipops R Us"
    fill_in "state", with: "Kentucky"

    click_on "Update Candy Shop"

    expect(current_path).to eq("/candy_shops/#{shop_1.id}")
    expect(page).to have_content("Lollipops R Us")
    expect(page).to have_content("Kentucky")
  end
end
