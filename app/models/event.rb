# typed: false
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
    where(name: 'new_user')
  }

  def previous_event_id
    self.previous_event_id = Event.where(user_id: user_id)
                                  .where(name: previous_event_name)
                                  .where(category: category).last&.id
  end

  scope :based_on_company_name, lambda { |company_name|
    joins(user: :company)
      .where('companies.name = ?', company_name)
  }

  def self.based_on_company_name_with_filter(company_name)
    select(based_on_company_name_columns_alias).based_on_company_name(company_name)
  end

  def self.based_on_company_name_columns_alias
    'events.user_id, events.id, events.started_at, events.finished_at, events.name AS event_name,'\
      ' events.category, events.metadata, events.previous_event_id, events.previous_event_name,'\
      ' events.next_event_name, events.created_at, users.name AS user_name'\
  end

  def self.graph_data(_since = 30.days.ago)
    company_name = User.current.company.name
    based_on_company_name(company_name).group(:name).count.to_a
  end

  def self.chart_type
    'pie'
  end
end
