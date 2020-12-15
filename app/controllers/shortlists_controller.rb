class ShortlistsController < ApplicationController
  def show
    @shortlist = Shortlist.find(params[:id])
    @placement_need = @shortlist.placement_need
    @child = @placement_need.child

    authorize @shortlist

    @filter_form = Forms::ShortlistFilter.new(filter_params)
    @available_foster_parents = @filter_form.foster_families
  end

private

  def filter_params
    p = params.permit(filter: { placement_types: [] })[:filter]
    if p.nil? && @placement_need
      { placement_types: [@placement_need.criteria] }
    else
      p
    end
  end
end
