# frozen_string_literal: true

require 'sidekiq'

class AccountConfirmationWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    begin
      routine = generate_routine

      UserEvent.unconfirmed_accounts.map { |unconfirmed_account|
        if Time.now.day - unconfirmed_account.last.started_at.day > 1
          generate_account_confirmation_email_event(unconfirmed_account.user_id)
          # resend_account_confirmation_email(unconfirmed_account.user_id)
        end
      }

      routine.update_columns(status: 'success', updated_at: Time.now, finished_at: Time.now)
    rescue StandardError => error
      routine&.update_columns(status: 'error', updated_at: Time.now, finished_at: Time.now)
      Raven.capture_exception(error)
    end
  end

  def generate_routine
    Routine.create!(
      name: 'accounts_confirmation',
      status: 'ongoing',
      started_at: Time.now,
      updated_at: Time.now
    )
  end

  def generate_account_confirmation_email_event(user_id)
    Event.create!(
      user_id: user_id,
      category: 'registration',
      name: 'second_account_confirmation_email',
      started_at: Time.now,
      finished_at: Time.now
    )
  end
end
