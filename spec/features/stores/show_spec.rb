require 'rails_helper'

describe "Store Show Page" do
  it "has the individual store and its attributes" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

    visit "/stores/#{store_1.id}"

    expect(page).to have_content("Stuff 4 Sale")
    expect(page).to have_content("150")
    expect(page).to have_content("true")
  end

  it "has a link to Update Store" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)
    
    visit "/stores/#{store_1.id}"

    expect(page).to have_link("Update Store")
  end

  describe "when I click on the Update Store link" do
    it "takes to the update form" do 
      dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

      store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

      visit "/stores/#{store_1.id}"

      click_on "Update Store"

      expect(current_path).to eq("/stores/#{store_1.id}/edit")
    end
  end

  it "has a Delete Store link" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

    visit "/stores/#{store_1.id}"

    expect(page).to have_button('Delete Store')
  end

  describe "When I click the Delete Store button" do
    it "Deletes the store and returns to the store list" do
      dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

      store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

      visit "/stores/#{store_1.id}"

      click_on "Delete Store"

      expect(current_path).to eq("/stores")

      expect(page).to have_content("Stores")
      expect(page).to have_no_content("Stuff 4 Sale")
      expect(page).to have_no_content("Shipments Received: 150")
      expect(page).to have_no_content("Open: true")
    end
  end
end