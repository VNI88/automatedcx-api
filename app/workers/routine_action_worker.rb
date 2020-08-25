# frozen_string_literal: true

require 'sidekiq'
require_relative '../../lib/whatsapp_message_sender.rb'

class RoutineActionWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(routine_id)
    begin
      routine = Routine.find_by_id(routine_id)
      case routine.action
      when 'send_whatsapp_menssage'
        metadata = JSON.parse(event_metadata(routine))
        metadata['users'].map { |user|
          message_body = "Hello #{user['name']},\n #{routine.message_template}"
          WhatsappMessageSender.new.send_message(user['phone'], message_body)
        }
      when 'send_email'
        # TO DO create a mailer with this function
      end

      routine.update_columns(status: 'completed', updated_at: Time.now, finished_at: Time.now)
    rescue StandardError => error
      routine&.update_columns(status: 'error', updated_at: Time.now, finished_at: Time.now)
      Raven.capture_exception(error)
    end
  end

  def event_metadata(routine)
    Event.where(user_id: routine.user_id).where(next_event_name: routine.monitored_event).last.metadata
  end
end
