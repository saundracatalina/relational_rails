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
end