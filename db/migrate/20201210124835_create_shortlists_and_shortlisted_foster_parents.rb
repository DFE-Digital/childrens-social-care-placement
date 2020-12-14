class CreateShortlistsAndShortlistedFosterParents < ActiveRecord::Migration[6.0]
  def change
    create_table :shortlists do |t|
      t.references :placement_need, null: false
      t.string :placement_types, null: true

      t.timestamps
    end

    create_table :shortlisted_foster_parents do |t|
      t.references :shortlist, null: false
      t.references :foster_parent, null: false

      t.timestamps
    end
  end
end
