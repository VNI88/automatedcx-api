# frozen_string_literal: true

require 'sidekiq'

class RoutineSchedulerWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    begin
      Routine.unscheduled.map { |routine|
        routine.update_columns(status: 'scheduled')
        case routine.monitoring_criteria
        when 'absence_of_event'
          RoutineActionWorker.perform_at(schedule_time(routine.starts_at), routine.id) if event_absent?(routine.user_id, routine.monitored_event)
          routine.update_columns(status: 'completed')
        when 'other'
          # Think in other posibilities
        end
      }
    rescue StandardError => error
      Raven.capture_exception(error)
    end
  end

  def event_absent?(user_id, event_name)
    Event.where(name: event_name).where(user_id: user_id)&.last.nil?
  end

  def schedule_time(time)
    ActiveSupport::TimeZone['UTC'].parse(time.strftime('%Y-%m-%d %H:%M:%S'))
  end
end
