# frozen_string_literal: true

require 'sidekiq'

class RoutineStatusWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    begin
      Routine.to_reschedule.map { |routine|
        case routine.periodicity
        when 'daily'
          routine.update_columns(status: 'unsheduled') if has_passed_a_day?(routine)
        when 'weekly'
          routine.update_columns(status: 'unsheduled') if has_passed_a_week?(routine)
        when 'monthly'
          routine.update_columns(status: 'unsheduled') if has_passed_a_month?(routine)
        end
      }
    rescue StandardError => error
      Raven.capture_exception(error)
    end
  end

  def has_passed_a_day?(routine)
    routine.finished_at.day < Time.zone.today
  end

  def has_passed_a_week?(routine)
    Time.zone.today - routine.finished_at.day == 8
  end

  def has_passed_a_month?(routine)
    routine.finished_at.month < Time.zone.today.month
  end
end
