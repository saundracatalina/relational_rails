require 'rails_helper'

describe 'when I visit Candy Shops show page' do
  it 'can see the candy shop and its attributes' do

    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    shop_2 = CandyShop.create!(name: "Dentist's Friend", state: "Nevada")

    visit "/candy_shops/#{shop_1.id}"

    expect(page).to have_content(shop_1.name)
    expect(page).to have_content(shop_1.state)

    visit "/candy_shops/#{shop_2.id}"

    expect(page).to have_content(shop_2.name)
    expect(page).to have_content(shop_2.state)
  end

  it 'has a Delete Candy Shop link' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

    visit "/candy_shops/#{shop_1.id}"

    expect(page).to have_link("Delete Candy Shop")
  end

  it 'has an Edit Candy Shop link' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

    visit "/candy_shops/#{shop_1.id}"

    expect(page).to have_link("Edit Candy Shop")
  end

    describe 'when I click the Edit Candy Shop link' do
      it 'takes me to a page with a form to edit a Candy Shop' do
        shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")

        visit "/candy_shops/#{shop_1.id}"

        click_on "Edit Candy Shop"

        expect(current_path).to eq("/candy_shops/#{shop_1.id}/edit")
        end
      end
end
