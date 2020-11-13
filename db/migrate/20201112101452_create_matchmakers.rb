class CreateMatchmakers < ActiveRecord::Migration[6.0]
  def change
    create_table :matchmakers do |t|
      t.references :user, null: false

      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
