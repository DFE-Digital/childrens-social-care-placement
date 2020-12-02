class CreatePlacementSuitabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :placement_suitabilities do |t|
      t.belongs_to :foster_parent
      t.boolean :available, default: false, null: false
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
      t.string :address_city
      t.string :address_county
      t.string :address_postcode

      t.timestamps
    end
  end
end
