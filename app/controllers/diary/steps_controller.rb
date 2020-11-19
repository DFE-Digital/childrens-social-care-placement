module Diary
  class StepsController < ApplicationController
    include WizardSteps
    self.wizard_class = Diary::Wizard

  private

    def step_path(step = params[:id])
      placement_diary_step_path(placement_id: params[:placement_id], id: step)
    end

    def wizard_store_key
      :diary
    end

    def wizard_context
      {
        "placement_id" => params[:placement_id],
      }
    end

    def set_page_title
      @page_title = "#{@current_step.title.downcase} step"
    end
  end
end
