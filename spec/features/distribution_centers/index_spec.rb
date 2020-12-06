 

RSpec.describe "distribution centers index page" do
  it "can see the name of each distribution center record in the system" do
    dc_1 = DistributionCenter.create!(name: "Oh Ship", trucks_deployed: 20)
    dc_2 = DistributionCenter.create!(name: "Ships Ahoy", trucks_deployed: 25)

    visit "/distribution_centers"

    expect(page).to have_content("Distribution Centers")
    expect(page).to have_content(dc_1.name)
    expect(page).to have_content(dc_2.name)
  end
  it "has link to create a new distribution center record" do

  visit "/distribution_centers"

  expect(page).to have_link("New Distribution Center", href: '/distribution_centers/new')
  end
end

