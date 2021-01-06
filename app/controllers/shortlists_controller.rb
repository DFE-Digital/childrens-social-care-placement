class ShortlistsController < ApplicationController
  def show
    @shortlist = Shortlist.find(params[:id])
    @placement_need = @shortlist.placement_need
    @child = @placement_need.child

    authorize @shortlist

    @filter_form = Forms::ShortlistFilter.new(filter_params)

    ps = filter_params.to_h.symbolize_keys.tap { |p| p[:placement_types].reject!(&:blank?) }
    @available_foster_parents = ShortlistFosterParentQuery.new(**ps).call
  end

private

  def filter_params
    p = params.permit(filter: {
      search_radius: "",
      latitude: "",
      longitude: "",
      placement_types: [],
    })[:filter]
    if p.nil? && @placement_need
      {
        placement_types: [@placement_need.criteria],
        search_radius: @placement_need.location_radius_miles,
        latitude: @placement_need.latitude,
        longitude: @placement_need.longitude,
      }
    else
      p
    end
  end
end
