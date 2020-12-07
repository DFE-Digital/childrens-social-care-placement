module PlacementCreation
  class StepsController < ApplicationController
    include WizardSteps
    self.wizard_class = PlacementCreation::Wizard

  private

    def step_path(step = params[:id])
      child_placement_creation_step_path(child_id: params[:child_id], id: step)
    end

    def wizard_store_key
      :placement_creation
    end

    def wizard_context
      {
        "child_id" => params[:child_id],
      }
    end

    def on_complete(placement)
      redirect_to(shortlist_path(placement.child_id))
    end
  end
end
