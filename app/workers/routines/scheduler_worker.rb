# typed: false
# frozen_string_literal: true

require 'sidekiq'

module Routines
  # Responsible to schedule routines automatially
  class SchedulerWorker
    include Sidekiq::Worker

    sidekiq_options retry: false

    def perform
      routines_evaluation
    rescue Routines::SchedulerWorkerError => e
      Sentry.capture_exception(e)
    end

    private

    def routines_evaluation
      Routine.unscheduled.each do |routine|
        routine.update_columns(status: 'scheduled')
        case routine.monitoring_criteria
        when 'absence_of_event'
          schedule(routine)
          routine.update_columns(status: 'completed')
        when 'other'
          # Think in other posibilities
        end
      end
    end

    def schedule(routine)
      return unless event_absent?(routine.user_id, routine.monitored_event)

      Routines::ActionWorker.perform_at(schedule_time(routine.starts_at), routine.id)
    end

    def event_absent?(user_id, event_name)
      Event.where(name: event_name).where(user_id: user_id)&.last.nil?
    end

    def schedule_time(time)
      ActiveSupport::TimeZone['UTC'].parse(time.strftime('%Y-%m-%d %H:%M:%S'))
    end
  end

  class SchedulerWorkerError < StandardError; end
end
