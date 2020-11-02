class CreateBasicFosterParentsChildrenPlacementsDiaryLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :foster_parents do |t|
      t.references :user, null: false

      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false

      t.timestamps
    end

    create_table :children do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false

      t.timestamps
    end

    create_table :placements do |t|
      t.references :foster_parent, null: false
      t.references :child, null: false

      t.timestamps
    end

    create_table :diary_logs do |t|
      t.references :placement, null: false

      t.text :note

      t.timestamps
    end
  end
end
