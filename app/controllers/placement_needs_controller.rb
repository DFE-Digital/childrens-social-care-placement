class PlacementNeedsController < ApplicationController
  def new
    @child = Child.find(params[:child_id])
    @placement_need = PlacementNeed.new
    authorize @placement_need
  end

  def create
    @placement_need = PlacementNeed.new(
      placement_need_params.merge(child_id: params[:child_id]),
    )
    authorize @placement_need

    if @placement_need.save
      redirect_to shortlist_path(params[:child_id])
    else
      render "new"
    end
  end

private

  def placement_need_params
    params.require(:placement_need).permit(
      :criteria,
      :placement_date,
      :postcode,
      :location_radius_miles,
    )
  end
end
