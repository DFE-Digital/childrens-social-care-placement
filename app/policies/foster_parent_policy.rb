class FosterParentPolicy < ApplicationPolicy
  def show?
    @auth_context.role_model.is_a?(FosterParent) && @auth_context.role_model == @record
  end
end
