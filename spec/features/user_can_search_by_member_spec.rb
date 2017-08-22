require 'rails_helper'

feature "user can search for house members" do
  scenario "user submits valid state name" do
    visit "/"
    select "Colorado", from: :state

    # And I click on Locate Members of the house"
    click_on "Locate Members of the House"

    # My path should be "/search" with "state=CO" in the params
    expect(current_path).to eq(search_path)

    #And I should see a message "7 results"
    expect(current_page).to have_content("7 results")

    # And I should see name, role, party, district

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end
