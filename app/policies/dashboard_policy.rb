class DashboardPolicy < ApplicationPolicy
  def matchmaker?
    @auth_context.role_model.is_a?(Matchmaker)
  end
end
