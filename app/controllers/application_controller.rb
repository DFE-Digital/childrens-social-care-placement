class ApplicationController < ActionController::Base
  include Pundit

  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :pundit_not_found

  before_action :authenticate_user!
  # rubocop:disable Rails/LexicallyScopedActionFilter
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
# rubocop:enable Rails/LexicallyScopedActionFilter

private

  def pundit_user
    AuthorisationContext.new(current_user)
  end

  def not_found
    render "errors/not_found", status: :not_found
  end

  def pundit_not_found
    render "errors/pundit_not_found", status: :not_found
  end
end
