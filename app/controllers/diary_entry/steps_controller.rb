module DiaryEntry
  class StepsController < ApplicationController
    include WizardSteps
    self.wizard_class = DiaryEntry::Wizard

  private

    def step_path(step = params[:id])
      diary_entry_step_path step
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
