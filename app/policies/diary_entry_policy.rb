class DiaryEntryPolicy < ApplicationPolicy
  def show?
    @auth_context.role_model.is_a?(FosterParent) && valid_placement
  end

  def valid_placement
    @auth_context.role_model.placements.pluck(:id).include? @record.placement_id
  end

  class Scope < Scope
    def resolve
      if @auth_context.role_model.is_a?(FosterParent)
        scope.where(placement_id: @auth_context.role_model.placements)
      end
    end
  end
end
