class AddLongAndLatToNeeds < ActiveRecord::Migration[6.0]
  def change
    change_table :placement_needs, bulk: true do |t|
      t.decimal :longitude
      t.decimal :latitude
    end
  end
end
