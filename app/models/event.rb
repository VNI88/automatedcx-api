class Event < ApplicationRecord
  include RailsAdminCharts
  belongs_to :user
  before_save :previous_event_id

  scope :unconfirmed_accounts, lambda {
    where(category: 'registration')
      .where(user_id: new_users.pluck(:user_id))
      .where.not(name: 'account_confirmation')
  }

  scope :new_users, lambda {
    where( name: 'new_user')
  }

  def previous_event_id
    self.previous_event_id = Event.where(user_id: self.user_id)
                                  .where(name: self.previous_event_name)
                                  .where(category: self.category).last&.id
  end

  scope :based_on_company_name, lambda { |company_name|
    joins(:user)
      .where('users.company_name = ?', company_name)
  }

  def self.graph_data since=30.days.ago
    company_name = User.current.company_name
    self.based_on_company_name(company_name).group(:name).count.to_a
  end

  def self.chart_type
    'pie'
  end
end
