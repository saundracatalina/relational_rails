require 'rails_helper'

describe 'when I visit Candy Shops index page' do
  it 'can see the name of each candy shop in the system' do

    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    shop_2 = CandyShop.create!(name: "Dentist's Friend", state: "Nevada")

    visit '/candy_shops'

    expect(page).to have_content(shop_1.name)
    expect(page).to have_content(shop_2.name)
  end

  it 'can see a link to create a new Candy Shop record' do

    visit '/candy_shops'

    expect(page).to have_link("New Candy Shop", href: '/candy_shops/new')
  end
end
