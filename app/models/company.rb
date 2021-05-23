# frozen_string_literal: true

class Company < ApplicationRecord
  include RailsAdminCharts
  include Pay::Billable

  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze

  has_many :users
  has_one :pricing

  before_save { self.pricing_id = Pricing.find_by(plan: :trial).id if pricing_id.nil? }
  before_save { self.processor = :stripe if processor.nil? }
  after_create :create_trial_subscription, :update_trial_end, :update_plan

  validates :email,
            presence: true,
            length: { maximum: 260 },
            format: { with: VALID_EMAIL_FORMAT },
            uniqueness: { case_sensitive: false }

  def create_trial_subscription
    @subscription = payment_processor.subscribe(
      name: :trial,
      plan: 'price_1IrrHkKCncLP87AK3hMQWDpo',
      trial_period_days: 30
    )
  end

  def update_trial_end
    update!(trial_ends_at: @subscription.trial_ends_at)
  end

  def update_plan
    update!(plan: @subscription.plan)
  end
end
