class DashboardPolicy < ApplicationPolicy
  def foster_parent?
    @auth_context.role_model.is_a?(FosterParent)
  end

  def matchmaker?
    @auth_context.role_model.is_a?(Matchmaker)
  end
end
