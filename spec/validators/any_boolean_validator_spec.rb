require "rails_helper"

RSpec.describe AnyBooleanValidator do
  class BooleanTestModel
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Validations::Callbacks

    attribute :likes_ice_cream, :boolean, default: false
    attribute :likes_jelly, :boolean, default: false

    validates_with AnyBooleanValidator, fields: %w[
      likes_ice_cream
      likes_jelly
    ]
  end

  describe "errors" do
    before { instance.valid? }
    subject { instance.errors.details[:base] }

    context "when both attributes blank" do
      let(:instance) { BooleanTestModel.new }
      it { is_expected.to include error: :options_blank }
    end

    context "when at least one attribute is true" do
      let(:instance) { BooleanTestModel.new likes_ice_cream: true }
      it { is_expected.to be_empty }
    end
  end
end
