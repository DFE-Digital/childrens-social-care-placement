class ShortlistsController < ApplicationController
  def show
    @child = Child.find(params[:id])
    @shortlist = Shortlist.new(child: @child)
    authorize @shortlist

    @placed = @child.placements.present?
    unless @placed
      @available_foster_parents = FosterParent.left_outer_joins(:placements).where(placements: { foster_parent_id: nil })
    end
  end
end
