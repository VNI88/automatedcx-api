class Routine < ApplicationRecord
  belongs_to :user

  scope :unscheduled, -> { where(status: 'unscheduled') }

  scope :based_on_company_name, lambda { |company_name, status|
    joins(:user)
      .where(status: status)
      .where('users.company_name = ?', company_name)
  }

  scope :to_reschedule, -> { where(status: 'completed') }
end

