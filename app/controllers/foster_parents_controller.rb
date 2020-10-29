class FosterParentsController < ApplicationController
  def show
    @foster_parent = FosterParent.find(params[:id])
    authorize @foster_parent

    @placements = @foster_parent.placements.includes(:child)
  end
end
