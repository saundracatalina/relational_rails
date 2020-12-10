require 'rails_helper'

describe 'When I visit the Candies index page' do
  it 'can see all Candies in the system and their attributes' do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")

    visit '/candies'

    expect(page).to have_content("Taffy")
    expect(page).to have_content("Quantity: 5")
    expect(page).to have_content("In Stock: true")
    expect(page).to have_content("Candy Shop Id: #{shop_1.id}")
    expect(page).to have_content("Created On: #{candy_1.created_at.strftime("%m/%d/%y")}")
  end
  it "can list Candies by date with in stock candies first" do
    shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
    candy_1 = Candy.create!(name: "Taffy", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")
    candy_2 = Candy.create!(name: "Fudge", quantity: 0, in_stock: false, candy_shop_id: "#{shop_1.id}")
    candy_3 = Candy.create!(name: "Gobstoppers", quantity: 7, in_stock: true, candy_shop_id: "#{shop_1.id}")

    expect(Candy.true_first.list_by_most_recent).to eq([candy_3, candy_1, candy_2])
  end
  # it "has a form with an input to Only return Candies with more than a specified number" do
  #   shop_1 = CandyShop.create!(name: "Sweet Tooth", state: "New York")
  #   candy_1 = Candy.create!(name: "Taffy", quantity: 7, in_stock: true, candy_shop_id: "#{shop_1.id}")
  #   candy_2 = Candy.create!(name: "Fudge", quantity: 0, in_stock: false, candy_shop_id: "#{shop_1.id}")
  #   candy_3 = Candy.create!(name: "Gobstoppers", quantity: 5, in_stock: true, candy_shop_id: "#{shop_1.id}")
  #
  #   visit '/candies'
  #
  #   expect(page).to have_content("Only return Candies with a quantity more than:")
  #   expect(page).to have_content("Type quantity here")
  #   expect(page).to have_field("Type quantity here")
  #   expect(page).to have_button("Submit")
  #
  #   fill_in "Only return Candies with a quantity more than:", with: 6
  #   click_on "Submit"
  #
  #   expect(current_path).to eq('/candies')
  #   expect(page).to have_content("Taffy")
  #   expect(page).to have_content("Quantity: 7")
  #   expect(page).to have_content("In Stock: true")
  #   expect(page).to have_content("Candy Shop Id: #{shop_1.id}")
  #   expect(page).to have_content("Created On: #{candy_1.created_at.strftime("%m/%d/%y")}")
  # end
end
