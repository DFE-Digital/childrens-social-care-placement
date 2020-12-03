class PlacementNeedPolicy < ApplicationPolicy
  def new?
    @auth_context.role_model.is_a?(Matchmaker)
  end

  def create?
    new?
  end
end
