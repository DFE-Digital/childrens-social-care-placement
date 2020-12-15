class RevertPostodeToAddressPostcode < ActiveRecord::Migration[6.0]
  def change
    rename_column :placement_suitabilities, :postcode, :address_postcode
  end
end
