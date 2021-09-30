# typed: false
# frozen_string_literal: true

require 'sidekiq'

module Routines
  # Responsible to execute routine actions
  class ActionWorker < ::ApplicationWorker
    include Sidekiq::Worker

    sidekiq_options retry: false

    def perform(routine_id)
      @routine = Routine.find(routine_id)
      @recipient_list = @routine.recipient_list
      @message_sender = @routine.message_sender
      @notification = @routine.notification

      Rails.logger.info("Creating sending event for routine_id: #{routine_id}")
      event = create_sending_event

      Rails.logger.info("Update notification - #{@notification.id} - status to: published")
      @notification.update!(status: :published)
      event.update!(finished_at: Time.current)

      Rails.logger.info("Creating service response event for routine_id: #{routine_id}")
      execute_routine(@routine.action)
      routine.update_columns(status: :completed, updated_at: Time.current, finished_at: Time.current)
    rescue Routines::ActionWorkerError => e
      @routine&.update!(status: :error, updated_at: Time.current, finished_at: Time.current)
      Sentry.capture_exception(e)
    end
  end

  private

  def execute_routine(action)
    send(action)
  end

  class ActionWorkerError < StandardError; end
end
