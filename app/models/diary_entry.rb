class DiaryEntry < ApplicationRecord
  belongs_to :placement, optional: false, inverse_of: :diary_entries

  validates :event, presence: true
  validates :note, presence: true
end
