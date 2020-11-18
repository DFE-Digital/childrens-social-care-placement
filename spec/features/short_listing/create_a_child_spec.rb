require "rails_helper"

RSpec.feature "Matchmaker creates a new Child", type: :feature do
  let(:matchmaker) { create(:matchmaker) }

  let(:child_attributes) { attributes_for(:child) }
  let(:created_child) { Child.last }

  background do
    sign_in(matchmaker.user)

    visit(new_child_path)
  end

  scenario "Matchmaker fills in the Child's details correctly, confirms creation and lands on the shortlist page" do
    fill_in "First name", with: child_attributes[:first_name]
    fill_in "Last name", with: child_attributes[:last_name]
    click_on "Continue"

    expect(page).to have_content("Foster families")
    expect(page).to have_content("For #{created_child.full_name}")
  end

  scenario "Matchmaker makes an error while providing the Child's details and stays on the form with errors" do
    fill_in "Last name", with: child_attributes[:last_name]
    click_on "Continue"

    expect(page).to have_content("There is a problem")
    expect(page).to have_content("Enter the first name")
  end
end
