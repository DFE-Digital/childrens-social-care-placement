class ShortlistsController < ApplicationController
  def show
    @child = Child.find(params[:id])
    @placement_need = @child.placement_need
    @shortlist = Shortlist.new(child: @child)

    authorize @shortlist

    @available_foster_parents = FosterParent.left_outer_joins(:placements).where(placements: { foster_parent_id: nil })
  end
end
