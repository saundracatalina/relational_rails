require 'rails_helper'

describe 'when I visit New Candy Shop page' do
  it 'displays a form to fill out and a button to Create Candy Shop record' do
    visit "/candy_shops/new"

    expect(page).to have_field("Name")
    expect(page).to have_field("State")
    expect(page).to have_content("Name")
    expect(page).to have_content("State")
    expect(page).to have_button("Create Candy Shop")
  end
  describe 'when I fill out the form with a new Candy Shop and click Create Candy Shop' do
    it 'redirects me to the Candy Shop Index page where I see the new Candy Shop displayed' do
      visit "/candy_shops/new"

        fill_in "name", with: "Lollipops R Us"
        fill_in "state", with: "Maryland"

        click_on "Create Candy Shop"

      expect(current_path).to eq('/candy_shops')
      expect(page).to have_content("Lollipops R Us")
    end
  end
end
