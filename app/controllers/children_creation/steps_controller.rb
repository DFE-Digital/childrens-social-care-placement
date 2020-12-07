module ChildrenCreation
  class StepsController < ApplicationController
    include WizardSteps
    self.wizard_class = ChildrenCreation::Wizard

  private

    def step_path(step = params[:id])
      children_creation_step_path(step)
    end

    def wizard_store_key
      :children_creation
    end

    def on_complete(child)
      redirect_to(child_placement_creation_step_path(
                    child_id: child.id,
                    id: PlacementCreation::Wizard.first_key,
                  ))
    end
  end
end
