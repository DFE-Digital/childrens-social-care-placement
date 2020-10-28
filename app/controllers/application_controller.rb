class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render "errors/not_found"
  end
end
