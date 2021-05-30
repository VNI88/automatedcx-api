# frozen_string_literal: true

require 'sidekiq'

module Routines
  # Responsible to execute routine actions
  class ActionWorker
    include Sidekiq::Worker

    sidekiq_options retry: false

    def perform(routine_id)
      routine = Routine.find_by_id(routine_id)
      execute(routine.action)
      routine.update_columns(status: :completed, updated_at: Time.current, finished_at: Time.current)
    rescue Routines::ActionWorkerError => e
      routine&.update_columns(status: :error, updated_at: Time.current, finished_at: Time.current)
      Raven.capture_exception(e)
    end

    private

    def execute_routine(action)
      case action
      when 'send_whatsapp_menssage'
        metadata = JSON.parse(event_metadata(routine))
        metadata['users'].map do |user|
          message_body = "Hello #{user['name']},\n #{routine.message_template}"
          MessageSender::Whatsapp.new(user['phone'], message_body).call
        end
      when 'send_email'
        # TO DO create a mailer with this function
      end
    end

    def event_metadata(routine)
      Event.where(user_id: routine.user_id).where(next_event_name: routine.monitored_event).last.metadata
    end
  end

  class ActionWorkerError < StandardError; end
end
