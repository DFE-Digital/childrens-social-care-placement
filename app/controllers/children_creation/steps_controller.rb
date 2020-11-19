module ChildrenCreation
  class StepsController < ApplicationController
    include WizardSteps
    self.wizard_class = ChildrenCreation::Wizard

  private

    def step_path(step = params[:id])
      children_creation_step_path(step)
    end

    helper_method :step_path

    def wizard_store
      ::Wizard::Store.new session_store
    end

    def session_store
      session[:children_creation] ||= {}
    end

    def on_complete(child)
      redirect_to(shortlist_path(child.id))
    end
  end
end
