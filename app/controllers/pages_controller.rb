class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def show
    render template: "pages/#{params[:page]}"
  end

  def postcode_api_error
    e = params[:e]
    render template: "pages/postcode_api_error", locals: { e: e }
  end
end
