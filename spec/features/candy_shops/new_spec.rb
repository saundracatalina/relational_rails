require 'rails_helper'

describe 'when I visit New Candy Shop page' do
  it 'displays a form to fill out and a button to Create Candy Shop record' do
    visit "/candy_shops/new"

    expect(page).to have_content("Name")
    expect(page).to have_content("State")
    expect(page).to have_button("Create Candy Shop")
  end
  describe 'when I fill out the form with a new Candy Shop and click Create Candy Shop' do
    it 'redirects me to the Candy Shop Index page where I see the new Candy Shop displayed' do
      visit "/candy_shops/new"
 # save_and_open_page
      fill_in 'Name', with: 'Lollipops R Us'
      fill_in 'State', with: 'Maryland'

      # click_on 'Create Candy Shop'
      click_button 'Create Candy Shop'

      expect(curent_path).to eq(/candy_shops)
      expect(page).to have_content('Lollipops R Us')
    end
  end
end
