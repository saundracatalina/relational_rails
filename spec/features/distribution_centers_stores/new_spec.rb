require 'rails_helper'

describe "New Store Page" do
  scenario "creates new store and returns to the DC's stores" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    visit "/distribution_centers/#{dc_1.id}/stores/new"

    fill_in 'Name', with: "Stuff 4 Sale"
    fill_in :shipments_received, with: 150
    fill_in :open, with: "n"

    click_on "Create Store"

    expect(current_path).to eq("/distribution_centers/#{dc_1.id}/stores")
# save_and_open_page
    expect(page).to have_content("Stuff 4 Sale")
  end
end