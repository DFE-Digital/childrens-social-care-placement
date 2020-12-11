require "rails_helper"

RSpec.describe PostcodeValidator do
  class PostcodeTestModel
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Validations::Callbacks

    attribute :postcode, :string

    validates :postcode, postcode: true
  end

  describe "errors" do
    before { instance.valid? }
    subject { instance.errors.details[:postcode] }

    context "with blank attribute" do
      let(:instance) { PostcodeTestModel.new }
      it { is_expected.to include error: :invalid }
    end

    context "with non existent postcode" do
      let(:instance) { PostcodeTestModel.new postcode: "123 rtf" }
      it { is_expected.to include error: :invalid }
    end

    context "with existing postcode" do
      let(:instance) { PostcodeTestModel.new postcode: "TR1 1uz" }
      it { is_expected.to be_empty }
    end
  end
end
