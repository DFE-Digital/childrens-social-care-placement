require "rails_helper"

RSpec.feature "Matchmaker sees available Foster Parents for a Child without a Placement and can place them", type: :feature do
  let(:matchmaker) { create(:matchmaker) }

  let(:child) { create(:child) }
  let(:placement_need) { create(:placement_need, child: child, criteria: "long_term") }
  let(:shortlist) { create(:shortlist, placement_need: placement_need) }

  let(:placement_suitabilities) { create_list(:placement_suitability, 2, long_term: true) }
  let!(:available_foster_parents) {  placement_suitabilities.map(&:foster_parent) }
  let!(:unavailable_foster_parent) { create(:placement).foster_parent }

  background do
    sign_in(matchmaker.user)

    visit(shortlist_path(shortlist.id))
  end

  context "When there are available Foster Parents" do
    scenario "Matchmaker looks at Shortlist for a Child which is not currently placed and sees available Foster Parents" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content(child.full_name)
      expect(page).to have_content("2 available families found")

      available_foster_parents.each do |fp|
        expect(page).to have_content(fp.full_name)
      end
    end

    scenario "Matchmaker selects an available Foster Parent from the Shortlist and creates a Placement" do
      within("#foster_parent_#{available_foster_parents.second.id}") do
        click_on "Place"
      end

      expect(page).to have_content("Placement created")
      expect(page).to have_content(child.full_name)
    end
  end

  context "When there are no available Foster Parents" do
    let!(:available_foster_parents) { [] }

    scenario "Matchmaker sees that there are no available Foster Parents" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content("There are currently no available foster families.")
    end
  end
end
