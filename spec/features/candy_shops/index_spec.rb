require 'rails_helper'

RSpec.describe 'when I visit candy shops' do
  it 'sees the name of each candy shop in the system' do

  shop_1 = CandyShop.create!(name: "Sweet Tooth")
  shop_2 = CandyShop.create!(name: "Dentist's Friend")

  visit '/candy_shops'
  
  expect(page).to have_content(shop_1.name)
  expect(page).to have_content(shop_2.name)
  end
end
