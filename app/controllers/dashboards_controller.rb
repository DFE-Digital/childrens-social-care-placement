class DashboardsController < ApplicationController
  def foster_parent
    authorize :dashboard

    @placements = pundit_user.role_model.placements.includes(placement_need: :child)
  end

  def matchmaker
    authorize :dashboard

    @shortlists = policy_scope(Shortlist)
      .joins(:placement_need)
      .left_outer_joins(placement_need: :placement)
      .where(placements: { id: nil })
  end
end
