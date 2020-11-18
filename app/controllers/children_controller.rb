class ChildrenController < ApplicationController
  def new
    @child = Child.new
    authorize @child
  end

  def create
    @child = Child.new(child_params)
    authorize @child

    if @child.save
      redirect_to(shortlist_path(@child.id))
    else
      render :new
    end
  end

private

  def child_params
    params.require(:child).permit(:first_name, :last_name)
  end
end
