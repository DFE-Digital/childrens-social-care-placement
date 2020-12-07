module PlacementCreation
  class WizardPolicy < ApplicationPolicy
    def show?
      @auth_context.role_model.is_a?(Matchmaker)
    end

    def update?
      show?
    end

    def completed?
      show?
    end
  end
end
