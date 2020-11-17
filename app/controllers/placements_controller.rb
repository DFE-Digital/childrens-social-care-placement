class PlacementsController < ApplicationController
  def create
    @placement = Placement.new(placement_params)
    authorize @placement

    @placement.save!
  end

private

  def placement_params
    params.require(:placement).permit(:foster_parent_id, :child_id)
  end
end
