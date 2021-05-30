# frozen_string_literal: true

require 'sidekiq'

module Routines
  # Responsible to  flag routines to be reschedule
  class StatusWorker
    include Sidekiq::Worker

    sidekiq_options retry: false

    def perform
      Routine.to_reschedule.map do |routine|
        update_routine_status(routine)
      end
    rescue Routines::StatusWorkerError => e
      Raven.capture_exception(e)
    end

    private

    def update_routine_status(routine)
      case routine.periodicity
      when 'daily'
        routine.update_columns(status: 'unsheduled') if passed_a_day?(routine)
      when 'weekly'
        routine.update_columns(status: 'unsheduled') if passed_a_week?(routine)
      when 'monthly'
        routine.update_columns(status: 'unsheduled') if passed_a_month?(routine)
      end
    end

    def passed_a_day?(routine)
      routine.finished_at.day < Time.current.day
    end

    def passed_a_week?(routine)
      (Time.current.day - routine.finished_at.day) == 8
    end

    def passed_a_month?(routine)
      routine.finished_at.month < Time.current.month
    end
  end

  class StatusWorkerError < StandardError; end
end
