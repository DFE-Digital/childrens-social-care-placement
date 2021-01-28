class ShortlistsController < ApplicationController
  helper_method :shortlist, :placement_need, :child, :filter_form

  def edit
    authorize shortlist

    @shortlisted_foster_parents = shortlist.foster_parents
    @available_foster_parents = ShortlistFosterParentQuery.new(
      placement_types: filter_form.placement_types,
      search_radius: filter_form.search_radius,
      latitude: filter_form.latitude,
      longitude: filter_form.longitude,
    ).call - @shortlisted_foster_parents
  end

  # This may not be the best solution, but we are using the :update route to persist the Shortlist
  # attributes. It then redirects back to the :edit page to be a refreshable page.
  def update
    authorize shortlist

    filter_form.assign_attributes(filter_params)
    filter_form.save!

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

  def filter_form
    @filter_form ||= Forms::ShortlistFilter.new(shortlist)
  end

  def filter_params
    params.permit(filter: { placement_types: [] })[:filter]
  end
end
