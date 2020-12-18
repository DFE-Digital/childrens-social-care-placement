class ShortlistsController < ApplicationController
  helper_method :shortlist, :placement_need, :child

  def edit
    authorize shortlist

    placement_types = shortlist.placement_types.split(",")
    @filter_form = Forms::ShortlistFilter.new(placement_types: placement_types)
    @available_foster_parents = ShortlistFosterParentQuery.new(placement_types: placement_types).call
  end

  # This may not be the best solution, but we are using the :update route to persist the Shortlist
  # attributes. It then redirects back to the :edit page to be a refreshable page.
  def update
    authorize shortlist

    redirect_to action: :edit
  end

private

  def shortlist
    @shortlist ||= Shortlist.find(params[:id])
  end

  def placement_need
    @placement_need ||= shortlist.placement_need
  end

  def child
    @child ||= placement_need.child
  end

  def filter_params
    params.permit(filter: { placement_types: [] })[:filter]
  end
end
