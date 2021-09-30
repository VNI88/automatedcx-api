# typed: true
# frozen_string_literal: true

require 'sidekiq'

# Responsible to send notification through our message senders
class NotificationWorker < ::ApplicationWorker
  include Sidekiq::Worker

  def perform(routine_id)
    ActiveRecord::Base.transaction do
      @routine = Routine.find(routine_id)
      @recipient_list = @routine.recipient_list
      @message_sender = @routine.message_sender
      @notification = @routine.notification

      logger.info("Creating sending event for routine_id: #{routine_id}")
      event = create_sending_event

      send_message

      logger.info("Update notification - #{@notification.id} - status to: published")
      @notification.update!(status: :publishes)
      event.update!(finished_at: Time.current)

      logger.info("Update routine_id - #{routine_id}, to completed")
      @routine.update!(status: :completed, updated_at: Time.current, finished_at: Time.current)

      logger.info("Creating service response event for routine_id: #{routine_id}")
      create_service_response_event
    end
  rescue NotificationWorkerError => e
    Sentry.capture_exception(e)
    logger.error(e)
  end
end

class NotificationWorkerError < StandardError; end
