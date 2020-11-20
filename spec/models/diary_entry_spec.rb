require "rails_helper"

RSpec.describe DiaryEntry do
  it { is_expected.to belong_to(:placement).required.inverse_of(:diary_entries) }

  it { is_expected.to validate_presence_of(:event) }
  it { is_expected.to validate_presence_of(:note) }
end
