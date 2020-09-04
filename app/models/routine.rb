class Routine < ApplicationRecord
  include RailsAdminCharts
  belongs_to :user

  scope :unscheduled, -> { where(status: 'unscheduled') }

  scope :based_on_company_name, lambda { |company_name, status|
    joins(:user)
      .where(status: status)
      .where('users.company_name = ?', company_name)
  }

  scope :to_reschedule, -> { where(status: 'completed') }

  def self.graph_data since=30.days.ago
    current_user_id = User.current.company_name
    self.based_on_company_name(current_user_id, %i[unscheduled scheduled completed]).group(:status).count.to_a
  end

  def self.chart_type
    'pie'
  end
end

