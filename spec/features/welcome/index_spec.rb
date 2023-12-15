require 'rails_helper'

# As a user,
# When I visit "/"
# And I Select "Fire Nation" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.

# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# - The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has

RSpec.describe 'welcome page', type: :feature do
  it 'can search for members of a nation' do
    visit root_path
    select 'Fire Nation', from: :nation
    click_button 'Search For Members'
    expect(current_path).to eq(search_path)
    expect(page).to have_content("Total Members = 97")
    expect(page).to have_content("Name: Azula")
    expect(page).to have_content("Allies: Ozai, Zuko")
    expect(page).to have_content("Enemies: Iroh, Zuko, Kuei, Long Feng, Mai, Ty Lee, Ursa")
    expect(page).to have_content("Affiliations: Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
    expect(page).to have_css('img[src="https://vignette.wikia.nocookie.net/avatar/images/1/12/Azula.png/revision/latest?cb=20140905084941"]')
  end
end