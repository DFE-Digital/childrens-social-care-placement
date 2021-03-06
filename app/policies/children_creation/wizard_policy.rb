module ChildrenCreation
  class WizardPolicy < ApplicationPolicy
    def show?
      @auth_context.role_model.is_a?(Matchmaker)
    end

    def update?
      show?
    end
  end
end
