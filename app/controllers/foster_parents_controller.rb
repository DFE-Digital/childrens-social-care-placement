class FosterParentsController < ApplicationController
  def show
    @foster_parent = FosterParent.find(params[:id])
    @placements = @foster_parent.placements.includes(:child)
  end
end
