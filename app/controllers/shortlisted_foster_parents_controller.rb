class ShortlistedFosterParentsController < ApplicationController
  def create
    shortlisted_foster_parents = ShortlistedFosterParent.new(create_params)
    authorize shortlisted_foster_parents

    shortlisted_foster_parents.save!
    redirect_to edit_shortlist_path(shortlisted_foster_parents.shortlist_id)
  end

private

  def create_params
    params.require(:shortlisted_foster_parent).permit(:foster_parent_id, :shortlist_id)
  end
end
