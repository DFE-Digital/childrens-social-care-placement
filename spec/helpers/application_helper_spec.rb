require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#govuk_form_for" do
    it "renders a form with GOV.UK form builder" do
      expect(govuk_form_for(StubModel.new, url: "http://test.com") {}).to eq(
        "<form class=\"new_stub_model\" id=\"new_stub_model\" novalidate=\"novalidate\" "\
        "action=\"http://test.com\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /></form>",
      )
    end
  end

  class StubModel
    include ActiveModel::Model
  end

  describe "#back_link" do
    it "renders a back link with GOV.UK class names" do
      expect(back_link).to eq("<a class=\"govuk-back-link\" href=\"javascript:history.back()\">Back</a>\n")
    end
  end
end
