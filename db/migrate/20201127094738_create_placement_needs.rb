class CreatePlacementNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :placement_needs do |t|
      t.belongs_to :child
      t.date :placement_date
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :county
      t.string :postcode
      t.integer :location_radius_miles

      t.timestamps
    end
  end
end
