class AddEventToDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :diary_entries, :event, :string
  end
end
