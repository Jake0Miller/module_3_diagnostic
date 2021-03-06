require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"

    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  scenario "we can search by zip" do
    visit "/"

    fill_in :q, with: 80203

    click_on "Locate"

    expect(current_path).to eq("/search")
    expect(page).to have_css('.station', count: 10)
    within(first('.station')) do
      expect(page).to have_content("Name: ")
      expect(page).to have_content("Location: ")
      expect(page).to have_content("Fuel Type: ")
      expect(page).to have_content("Distance: ")
      expect(page).to have_content("Access Times: ")
    end
  end
end
