require 'rails_helper'

describe "distribution centers new page" do
  scenario "can see a form for a new distribution center record" do
    visit "distribution_centers/new"

    fill_in 'Name', with: 'example'
    fill_in 'trucks_deployed', with: "5"

    click_on 'Create Distribution Center'

    expect(current_path).to eq("/distribution_centers")

    expect(page).to have_content("Distribution Centers")
    expect(page).to have_content("example")
  end
end
