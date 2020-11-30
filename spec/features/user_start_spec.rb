require "rails_helper"

RSpec.feature "User can start using the system by signing in and being redirected to the right place", type: :feature do
  context "User is a foster parent" do
    let(:user) { create(:foster_parent).user }

    scenario "User is not signed in, clicks Start on the homepage, signs in and is redirected to their dashboard page" do
      visit "/"

      click_on "Start"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Sign in"

      expect(page).to have_content("Children in your care")
    end

    scenario "User is already signed in, clicks Start on the homepage and is redirected to their dashboard page" do
      sign_in(user)

      visit "/"

      click_on "Start"

      expect(page).to have_content("Children in your care")
    end
  end

  context "User is a matchmaker" do
    let(:user) { create(:matchmaker).user }

    scenario "User is not signed in, clicks Start on the homepage, signs in and is redirected to their dashboard page" do
      visit "/"

      click_on "Start"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Sign in"

      expect(page).to have_content("Child's placements with foster families")
    end

    scenario "User is already signed in, clicks Start on the homepage and is redirected to their dashboard page" do
      sign_in(user)

      visit "/"

      click_on "Start"

      expect(page).to have_content("Child's placements with foster families")
    end
  end

  context "User is of an 'unspecified' type" do
    let(:user) { create(:user) }

    scenario "User is not signed in, clicks Start on the homepage, signs in and is redirected back to the home page" do
      visit "/"

      click_on "Start"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Sign in"

      expect(page).to have_content("Welcome to Children Social Care Placement!")
    end

    scenario "User is already signed in, clicks Start on the homepage and is redirected back to the homepage" do
      sign_in(user)

      visit "/"

      click_on "Start"

      expect(page).to have_content("Welcome to Children Social Care Placement!")
    end

    scenario "User it not signed in, clicks Start but provides incorrect sign in details" do
      visit "/"

      click_on "Start"
      fill_in "Email", with: user.email
      fill_in "Password", with: "wrong password"
      click_on "Sign in"

      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
