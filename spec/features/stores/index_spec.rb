require 'rails_helper'

describe "Stores Index Page" do
  it "can see all stores and their attributes" do
    dc = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc.id}", open: true)

    visit "/stores"

   
    expect(page).to have_content("Stuff 4 Sale")
    expect(page).to have_content("Shipments Received: 150")
    expect(page).to have_content("DC ID: #{dc.id}")
    expect(page).to have_content("Open: true")
  end

  it 'lists true results first' do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
    dc_2 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_2.id}", open: false)
    store_2 = Store.create!(name: "Stuff, Stuff, Stuff", shipments_received: 10, distribution_center_id: "#{dc_1.id}", open: true)

    visit stores_path
    
    # save_and_open_page
  end
end