require "rails_helper"

RSpec.describe Child, type: :model do
  subject(:model) { build(:child) }

  it { is_expected.to define_enum_for(:gender).with_values(male: 1, female: 2, other: 3) }

  it { is_expected.to validate_presence_of(:date_of_birth) }
  it { is_expected.to validate_presence_of(:gender) }

  it_behaves_like "name identifiable model" do
    let(:model_class) { described_class }
  end

  describe "#age" do
    subject(:age) { travel_to(current_time) { model.age } }

    let(:model) { build(:child, date_of_birth: date_of_birth) }
    let(:current_time) { "2020-11-10 11:10" }

    context "when the birthday already occurred in the current year" do
      let(:date_of_birth) { "2010-11-01" }

      it "returns the correct age" do
        is_expected.to be 10
      end
    end

    context "when the birthday is coming up later in the current year" do
      let(:date_of_birth) { "2010-12-01" }

      it "returns the correct age" do
        is_expected.to be 9
      end
    end
  end
end
