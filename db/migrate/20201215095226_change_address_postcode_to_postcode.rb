class ChangeAddressPostcodeToPostcode < ActiveRecord::Migration[6.0]
  def change
    rename_column :placement_suitabilities, :address_postcode, :postcode
  end
end
