require "rails_helper"

RSpec.describe DiaryLog do
  it { is_expected.to belong_to(:placement).required.inverse_of(:diary_logs) }
end
