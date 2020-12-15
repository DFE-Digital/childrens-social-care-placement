require "rails_helper"

RSpec.feature "Matchmaker can access the system features through their dashboard", type: :feature do
  let(:unplaced_child) { create(:child, first_name: "New", last_name: "Child") }
  let(:placement_need) { create(:placement_need, child: unplaced_child) }
  let!(:shortlist_without_placement) { create(:shortlist, placement_need: placement_need) }

  let!(:shortlist_with_placement) do
    create(:shortlist).tap { |s| create(:placement, placement_need: s.placement_need) }
  end

  background do
    sign_in(user)

    visit(dashboards_matchmaker_path)
  end

  context "User is a matchmaker" do
    let(:user) { create(:matchmaker).user }

    scenario "Matchmaker can start the journey of placing a new child" do
      click_on "Find a child's placement"

      expect(page).to have_content("Enter a child's details")
    end

    scenario "Matchmaker can see the list of shortlisting activity in progress and can continue" do
      expect(page).to have_content("Open shortlists")
      expect(page).not_to have_content(shortlist_with_placement.placement_need.child.full_name)

      click_on unplaced_child.full_name

      expect(page).to have_content("Foster families")
      expect(page).to have_content(unplaced_child.full_name)
    end
  end

  context "User is not a matchmaker" do
    let(:user) { create(:foster_parent).user }

    scenario "User does not have access and the page responds with 404 not found error" do
      expect(page.status_code).to be 404
    end
  end
end
