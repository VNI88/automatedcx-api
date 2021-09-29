# typed: true
# frozen_string_literal: true

require 'sidekiq'

# Responsible to execute routine actions
class SubscriptionWorker
  include Sidekiq::Worker

  def perform(company_id)
    company = Company.find(company_id)
    return if company.subscriptions.find_by(name: :trial).present?

    create_trial_subscription(company)
    update_trial_end(company)
    update_plan(company)
  rescue SubscriptionWorkerError => e
    Sentry.capture_exception(e)
  end

  private

  def create_trial_subscription(company)
    @subscription = company.payment_processor.subscribe(
      name: :trial,
      plan: 'price_1IrrHkKCncLP87AK3hMQWDpo',
      trial_period_days: 30
    )
  end

  def update_trial_end(company)
    company.update!(trial_ends_at: company.subscriptions.last.trial_ends_at)
  end

  def update_plan(company)
    company.update!(plan: @subscription.name)
  end
end

class SubscriptionWorkerError < StandardError; end
