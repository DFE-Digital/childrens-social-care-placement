module Diary
  class StepsController < ApplicationController
    include WizardSteps
    self.wizard_class = Diary::Wizard

  private

    def step_path(step = params[:id])
      placement_diary_step_path(placement_id: params[:placement_id], id: step)
    end
    helper_method :step_path

    def wizard_store
      ::Wizard::Store.new session_store
    end

    def session_store
      session[:diary] ||= {}
    end

    def set_page_title
      @page_title = "#{@current_step.title.downcase} step"
    end
  end
end
