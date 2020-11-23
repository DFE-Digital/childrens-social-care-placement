require "rails_helper"

RSpec.feature "FosterParent views diary entries", type: :feature do
  let(:foster_parent) { create(:foster_parent) }
  let(:child) { create(:child) }
  let!(:placement) { create(:placement, foster_parent: foster_parent, child: child) }
  let!(:diary_entries) { create_list(:diary_entry, 3, placement: placement) }

  before do
    sign_in(foster_parent.user)

    visit(dashboards_foster_parent_path)
    click_on "View diary entries"
  end

  scenario "by visiting the diary logs index and show pages" do
    expect(page).to have_text "Foster logs for #{child.full_name}"
    expect(page).to have_text diary_entries.first.note, count: 3
    within first(".govuk-summary-list") do
      first(:link, "View entry").click
    end

    expect(page).to have_text diary_entries.first.note
    expect(page).to have_link("Return to logs")
  end
end
