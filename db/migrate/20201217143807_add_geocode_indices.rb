class AddGeocodeIndices < ActiveRecord::Migration[6.0]
  def change
    add_index :placement_needs, %i[latitude longitude]
    add_index :placement_suitabilities, %i[latitude longitude]
  end
end
