require "rails_helper"

RSpec.feature "Matchmaker creates a new PlacementNeed", type: :feature do
  include ChildHelper

  let(:matchmaker) { create(:matchmaker) }
  let(:child) { create(:child) }

  background do
    sign_in(matchmaker.user)

    visit(new_child_placement_need_path(child_id: child.id))
  end

  scenario "Matchmaker fills in the placement_need's details correctly, proceeds to the shortlist page" do
    expect(page).to have_content("When does #{full_name(child.id)} need a new foster home?")

    fill_in "Day", with: Time.zone.today.day
    fill_in "Month", with: Time.zone.today.month
    fill_in "Year", with: Time.zone.today.year

    expect(page).to have_content("What type of placement does #{full_name(child.id)} need?")

    choose "Short Term"

    expect(page).to have_content("What is the placement area for #{full_name(child.id)}?")

    fill_in "Postcode", with: "TR1 1UZ"
    fill_in "Search Radius (miles)", with: 10
    click_on "Continue"

    expect(page).to have_content("Foster families")
  end
end
