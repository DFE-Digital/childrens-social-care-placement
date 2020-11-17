require "rails_helper"

RSpec.feature "Matchmaker sees available Foster Parents for a Child without a Placement and can place them", type: :feature do
  let(:matchmaker) { create(:matchmaker) }

  let!(:available_foster_parents) { create_list(:foster_parent, 2) }
  let!(:unavailable_foster_parent) { create(:placement).foster_parent }

  background do
    sign_in(matchmaker.user)

    visit(shortlist_path(child.id))
  end

  context "When the Child is not placed and there are available Foster Parents" do
    let(:child) { create(:child) }

    scenario "Matchmaker looks at Shortlist for a Child which is not currently placed and sees available Foster Parents" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content(child.full_name)
      expect(page).to have_content("2 available families found:")

      available_foster_parents.each do |fp|
        expect(page).to have_content(fp.full_name)
      end
    end

    xscenario "Matchmaker selects an available Foster Parent from the Shortlist and creates a Placement" do
      within("#foster_parent_#{available_foster_parents.second.id}") do
        click_on "Place"
      end
    end
  end

  context "When the Child is not placed but there are no available Foster Parents" do
    let!(:available_foster_parents) { [] }
    let(:child) { create(:child) }

    scenario "Matchmaker sees that there are no available Foster Parents" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content("There are currently no available foster families.")
    end
  end

  context "When the Child is already placed" do
    let(:child) do
      create(:child).tap do |c|
        create(:placement, child: c)
      end
    end

    scenario "Matchmaker tries to look at a Shortlist for a Child that is already placed and sees a notification" do
      expect(page).to have_content("Foster families")
      expect(page).to have_content("#{child.full_name} is currently placed.")
    end
  end
end
