class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def show
    render template: "pages/#{params[:page]}"
  end
end
