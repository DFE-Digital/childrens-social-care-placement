class DiaryEntriesController < ApplicationController
  def index
    @placement = Placement.find params[:placement_id]
    @diary_entries = policy_scope(
      DiaryEntry.where(placement_id: params[:placement_id])
                .order(created_at: :desc),
    )
  end

  def show
    @entry = DiaryEntry.find params[:id]
    authorize @entry
  end
end
