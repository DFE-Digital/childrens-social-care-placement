module Diary
  class WizardPolicy < ApplicationPolicy
    def show?
      @auth_context.role_model.is_a?(FosterParent)
    end

    def update?
      show?
    end

    def completed?
      show?
    end
  end
end
