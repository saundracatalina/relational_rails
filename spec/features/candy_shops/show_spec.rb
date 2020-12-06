require 'rails_helper'

describe 'when I visit Candy Shops show page' do
  it 'can see the candy shop and its attributes' do

    shop_1 = CandyShop.create!(name: "Sweet Tooth")
    shop_2 = CandyShop.create!(name: "Dentist's Friend")

    visit "/candy_shops/#{shop_1.id}"

    expect(page).to have_content(shop_1.name)
    expect(page).to have_content(shop_1.state)

    visit "/candy_shops/#{shop_2.id}"

    expect(page).to have_content(shop_2.name)
    expect(page).to have_content(shop_2.state)
  end

  it 'has an Update Candy Shop link' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth")

    visit "/candy_shops/#{shop_1.id}"

    expect(page).to have_link("Update Candy Shop")
  end
describe 'when I click the Update Candy Shop link' do
  it 'takes me to a page with a form to edit a Candy Shop' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth")

    visit "/candy_shops/#{shop_1.id}"

    click_on "Update Candy Shop"

    expect(current_path).to eq("/candy_shops/#{shop_1.id}/edit")
    end
  end
end
