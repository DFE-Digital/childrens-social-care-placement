class AddGenderToChildren < ActiveRecord::Migration[6.0]
  def change
    add_column :children, :gender, :integer
  end
end
