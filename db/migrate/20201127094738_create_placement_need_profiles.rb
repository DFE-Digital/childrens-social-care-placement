class CreatePlacementNeedProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :placement_need_profiles do |t|
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
      t.string :addr1
      t.string :addr2
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
