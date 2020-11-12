class DashboardsController < ApplicationController
  def matchmaker
    authorize :dashboard
  end
end
