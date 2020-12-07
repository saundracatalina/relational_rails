require 'rails_helper'

describe "edit Distribution Centers page" do
  it "has a form to edit the Distribution Center" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

    visit "/distribution_centers/#{dc_1.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("Trucks deployed")
    
  end

  scenario "when I fill out the form on the Update Distribution Center and submit" do
      dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)

      visit "/distribution_centers/#{dc_1.id}/edit"

      fill_in 'Name', with: 'example'
      fill_in 'trucks_deployed', with: "5"

      click_on 'Update Distribution Center'

      expect(current_path).to eq("/distribution_centers/#{dc_1.id}")
  end
end