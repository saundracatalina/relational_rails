require 'rails_helper'

describe "Stores Index Page" do
  it "can see all stores and their attributes" do
    dc = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_centers_id: "#{dc.id}", open: true)

    visit "/stores"

   
    expect(page).to have_content("Stuff 4 Sale")
    expect(page).to have_content("Shipments Received: 150")
    expect(page).to have_content("DC ID: #{dc.id}")
    expect(page).to have_content("Open: true")
  end
end