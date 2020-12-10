require "rails_helper"

RSpec.feature "FosterParent creates a diary entry", type: :feature do
  let(:foster_parent) { create(:foster_parent) }
  let!(:placement) { create(:placement, foster_parent: foster_parent) }

  before do
    sign_in(foster_parent.user)

    visit(dashboards_foster_parent_path)
    click_on "Create a diary entry"
  end

  scenario "by completing the diary entry flow" do
    expect(page).to have_text "Select the event you wish to write about"
    choose "School Life"
    click_on "Continue"

    expect(page).to have_text "Describe the event"
    fill_in("diary-steps-note-entry-field", with: "some text goes here")
    click_on "Continue"

    expect(page).to have_text "Review your diary entry"
    click_on "Complete"

    expect(page).to have_text "Completion text goes here..."
  end
end
