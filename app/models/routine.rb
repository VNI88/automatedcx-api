class Routine < ApplicationRecord
  belongs_to :user

  scope :unscheduled, lambda { where(status: 'unscheduled') }

  scope :to_reschedule, lambda { where(status: 'completed') }
end
