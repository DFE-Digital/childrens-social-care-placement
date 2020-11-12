class ChangeDiaryLogsToDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    rename_table :diary_logs, :diary_entries
  end
end
