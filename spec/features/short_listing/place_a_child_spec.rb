require "rails_helper"

RSpec.feature "Matchmaker sees shortlisted Foster Parents for a Child and can place them", type: :feature do
  let(:matchmaker) { create(:matchmaker) }

  let(:child) { create(:child) }
  let(:placement_need) { create(:placement_need, child: child, criteria: "long_term") }
  let(:shortlist) { create(:shortlist, placement_need: placement_need) }

  let!(:shortlisted_foster_parent) do
    create(:foster_parent).tap { |fp| shortlist.foster_parents << fp }
  end

  background do
    sign_in(matchmaker.user)

    visit(edit_shortlist_path(shortlist.id))
  end

  context "When there are shortlisted Foster Parents" do
    scenario "Matchmaker looks at Shortlist for a Child which is not currently placed and sees available Foster Parents" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content(child.full_name)

      within("#shortlisted_foster_parents") do
        expect(page).to have_content(shortlisted_foster_parent.full_name)
      end
    end

    scenario "Matchmaker selects a shortlisted Foster Parent from and creates a Placement" do
      within("#foster_parent_#{shortlisted_foster_parent.id}") do
        click_on "Place"
      end

      expect(page).to have_content("Placement created")
      expect(page).to have_content(child.full_name)
    end
  end

  context "When there are no shortlisted Foster Parents" do
    let!(:shortlisted_foster_parent) { nil }

    scenario "Matchmaker sees that there are no available Foster Parents" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content("No foster parents have been shortlisted.")
    end
  end
end
