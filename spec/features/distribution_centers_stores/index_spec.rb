require 'rails_helper'

describe "Distribution Centers Stores page" do
  it "shows all stores belonging to the distribution center" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
    dc_2 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)
    store_2 = Store.create!(name: "Stuff, Stuff, Stuff", shipments_received: 10, distribution_center_id: "#{dc_2.id}", open: true)

    visit "/distribution_centers/#{dc_1.id}/stores"

    expect(page).to have_content("Stuff 4 Sale")
    expect(page).to have_content("150")
    expect(page).to have_content("true")
    expect(page).to have_no_content("Stuff, Stuff, Stuff")
  end

  it "has a 'Create Store' link" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

    visit "/distribution_centers/#{dc_1.id}/stores"

    expect(page).to have_link("Create Store")
  end

  describe "When I click the Create Store link" do
    it "takes me to the create store form" do
      dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

      store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

      visit "/distribution_centers/#{dc_1.id}/stores"

      click_on "Create Store"
      
      expect(current_path).to eq("/distribution_centers/:id/stores/new")
    end
  end
end