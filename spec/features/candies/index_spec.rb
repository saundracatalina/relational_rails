require 'rails_helper'

describe 'When I visit the Candies index page' do
  it 'can see all Candies in the system and their attributes' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit '/candies'

    expect(page).to have_content("Taffy")
    expect(page).to have_content("5")
    expect(page).to have_content("true")
    expect(page).to have_content("Taffy")
    expect(page).to have_content("#{shop_1.id}")
  end
end

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
