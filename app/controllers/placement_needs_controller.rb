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
    @shortlist = Shortlist.new(placement_need: @placement_need, placement_types: @placement_need.criteria)

    authorize @placement_need
    authorize @shortlist

    if @placement_need.save && @shortlist.save
      redirect_to shortlist_path(@shortlist)
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
