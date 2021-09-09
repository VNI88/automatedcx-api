# typed: true
class Routine < ApplicationRecord
  include RailsAdminCharts
  belongs_to :user

  scope :unscheduled, -> { where(status: 'unscheduled') }

  scope :based_on_company_name, lambda { |company_name, status|
    joins(user: :company)
      .where(status: status)
      .where('companies.name = ?', company_name)
  }

  scope :to_reschedule, -> { where(status: 'completed') }

  def self.graph_data(_since = 30.days.ago)
    company_name = User.current.company.name
    based_on_company_name(company_name, %i[unscheduled scheduled completed]).group(:status).count.to_a
  end

  def self.chart_type
    'pie'
  end
end
