require "rails_helper"

RSpec.feature "Matchmaker creates a new Child", type: :feature do
  let(:matchmaker) { create(:matchmaker) }

  let(:child_attributes) { attributes_for(:child) }
  let(:created_child) { Child.last }

  background do
    sign_in(matchmaker.user)

    visit(dashboards_matchmaker_path)
    click_on "Place a child"
  end

  scenario "Matchmaker fills in the Child's details correctly, confirms creation and lands on the shortlist page" do
    fill_in "First name", with: child_attributes[:first_name]
    fill_in "Last name", with: child_attributes[:last_name]
    fill_in "Day", with: child_attributes[:date_of_birth].day
    fill_in "Month", with: child_attributes[:date_of_birth].month
    fill_in "Year", with: child_attributes[:date_of_birth].year
    click_on "Continue"

    expect(page).to have_content("Check this is the child you want to find a foster family for?")
    expect(page).to have_content("Name #{child_attributes[:first_name]} #{child_attributes[:last_name]}")
    click_on "Continue"

    expect(page).to have_content("Foster families")
    expect(page).to have_content("For #{created_child.full_name}")
  end

  scenario "Matchmaker makes an error while providing the Child's details and stays on the form with errors" do
    fill_in "Last name", with: child_attributes[:last_name]
    click_on "Continue"

    expect(page).to have_content("There is a problem")
    expect(page).to have_content("Enter the first name")
    expect(page).to have_content("Enter the date of birth")
  end

  scenario "Matchmaker fills in the Child's details correctly, decides to change name and lands on the form again" do
    fill_in "First name", with: child_attributes[:first_name]
    fill_in "Last name", with: child_attributes[:last_name]
    fill_in "Day", with: child_attributes[:date_of_birth].day
    fill_in "Month", with: child_attributes[:date_of_birth].month
    fill_in "Year", with: child_attributes[:date_of_birth].year
    click_on "Continue"

    within find(".govuk-summary-list__row", match: :first) do
      click_on "Change"
    end

    expect(page).to have_content("Enter a child's details")
    expect(page).to have_field("First name", with: child_attributes[:first_name])
    expect(page).to have_field("Last name", with: child_attributes[:last_name])
    expect(page).to have_field("Day", with: child_attributes[:date_of_birth].day)
    expect(page).to have_field("Month", with: child_attributes[:date_of_birth].month)
    expect(page).to have_field("Year", with: child_attributes[:date_of_birth].year)
  end
end
