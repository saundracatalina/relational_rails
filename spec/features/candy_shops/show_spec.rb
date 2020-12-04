require 'rails_helper'

RSpec.describe 'when I visit candy shops show page' do
  it 'can see the candy shop and its attributes' do

  shop_1 = CandyShop.create!(name: "Sweet Tooth")
  shop_2 = CandyShop.create!(name: "Dentist's Friend")

  visit "/candy_shops/#{shop_1.id}"

  expect(page).to have_content(shop_1.name)

  visit "/candy_shops/#{shop_2.id}"

  expect(page).to have_content(shop_2.name)
  end
end
