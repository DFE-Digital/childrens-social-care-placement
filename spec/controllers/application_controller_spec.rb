require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  describe "#postcode_api_error" do
    login_user
    controller do
      def index
        raise Faraday::Error, "connection failure"
      end
    end

    it {
      is_expected.to rescue_from(Faraday::Error)
      .with(:postcode_api_error)
    }

    it "redirects to custom error page with exception message" do
      get :index
      expect(response).to redirect_to postcode_api_error_path(e: "connection failure")
    end
  end
end
