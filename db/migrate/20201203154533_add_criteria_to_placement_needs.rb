class AddCriteriaToPlacementNeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :placement_needs, :criteria, :string
  end
end
