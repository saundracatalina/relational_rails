require 'rails_helper'

describe "Store Edit Page" do
  it "Has a form to edit the Store's attributes" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

    visit "/stores/#{store_1.id}/edit"

    expect(page).to have_field(:name)
    expect(page).to have_field(:shipments_received)
    expect(page).to have_field(:open)
  end

  describe "When I click the Update Store button" do
    it "updates the store and takes me back to that store's page" do
      dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    store_1 = Store.create!(name: "Stuff 4 Sale", shipments_received: 150, distribution_center_id: "#{dc_1.id}", open: true)

    visit "/stores/#{store_1.id}/edit"

    fill_in :name, with: 'More Stuff'
    fill_in :shipments_received, with: 26
    fill_in :open, with: false

    click_on 'Update Store'

    expect(current_path).to eq("/stores/#{store_1.id}")

    expect(page).to have_content("More Stuff")
    expect(page).to have_content(26)
    expect(page).to have_content(false)
    end
  end
end
