class DiaryLog < ApplicationRecord
  belongs_to :placement, optional: false, inverse_of: :diary_logs
end
