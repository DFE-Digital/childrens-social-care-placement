class CreatePlacementNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :placement_needs do |t|
      t.belongs_to :child
      t.date :placement_date
      t.boolean :long_term, default: false, null: false
      t.boolean :short_term, default: false, null: false
      t.boolean :emergency, default: false, null: false
      t.boolean :respite, default: false, null: false
      t.boolean :short_break, default: false, null: false
      t.boolean :remand, default: false, null: false
      t.boolean :specialist_theraputic, default: false, null: false
      t.boolean :parent_and_child, default: false, null: false
      t.string :address_line_1
      t.string :address_line_2
      t.string :town
      t.string :county
      t.string :postcode
      t.integer :location_radius

      t.timestamps
    end
  end
end
