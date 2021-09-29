# typed: true
# frozen_string_literal: true

require 'wikipedia'

# This class is responsible to make a research on Wikipedia

module Consulter
  class Wikipedia
    def initialize(theme)
      @theme = theme
    end

    def call
      result = ::Wikipedia.find(@theme)
      OpenStruct.new({ success?: true, payload: result })
    rescue StandardError => e
      Sentry.capture_exception(e)
      OpenStruct.new({ success?: false, error: e})
    end
  end
end
