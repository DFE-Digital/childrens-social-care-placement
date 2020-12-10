class ChangeChildPlacementReference < ActiveRecord::Migration[6.0]
  def change
    # This is obviously a migration that would never work in production environment, but for the Alpha
    # it's ok. We will squash all migrations once we complete it and start from scratch for Beta.
    add_reference :placements, :placement_need, null: false # rubocop:disable Rails/NotNullColumn
    remove_reference :placements, :child
  end
end
