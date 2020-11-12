class DashboardsController < ApplicationController
  def foster_parent
    authorize :dashboard

    @placements = pundit_user.role_model.placements.includes(:child)
  end

  def matchmaker
    authorize :dashboard
  end
end
