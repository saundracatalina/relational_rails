require 'rails_helper'

RSpec.describe "distribution centers show page" do
  it "can see the distribution center and its attributes" do
    
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
    dc_2 = DistributionCenter.create!(name: "Ships Ahoy", trucks_deployed: 25)
    
    
    visit "/distribution_centers/#{dc_1.id}"

    expect(page).to have_content(dc_1.name)
    expect(page).to have_content(dc_1.id)
    expect(page).to have_content(dc_1.created_at)
    expect(page).to have_content(dc_1.updated_at)
    expect(page).to have_content(dc_1.trucks_deployed)
    
    visit "/distribution_centers/#{dc_2.id}"

    expect(page).to have_content(dc_2.name)
    expect(page).to have_content(dc_2.id)
    expect(page).to have_content(dc_2.created_at)
    expect(page).to have_content(dc_2.updated_at)
    expect(page).to have_content(dc_2.trucks_deployed)
  end
end
