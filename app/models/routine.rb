class Routine < ApplicationRecord
  belongs_to :user

  scope :unscheduled, -> { where(status: 'unscheduled') }

  scope :to_reschedule, -> { where(status: 'completed') }
end
