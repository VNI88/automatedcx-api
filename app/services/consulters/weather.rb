# typed: true
# frozen_string_literal: true

require 'open_weather'

# This class is responsible to check weather in a
# specific location

module Consulters
  class Weather
    def initialize(location)
      @location = location
    end

    def call
      options = {
        units: 'metric',
        APPID: ENV['OPEN_WEATHER_TOKEN'],
        lang: 'pt_br'
      }

      # city sample 'Aracaju, BR'
      result = OpenWeather::Current.city(@location, options)
      if result.present?
        OpenStruct.new({ success?: true, payload: formatted_result(result) })
      else
        OpenStruct.new({ success?: false , error: 'Location not found.' })
      end
    rescue StandardError => e
      Sentry.capture_exception(e)
      OpenStruct.new({ success?: false, error: e })
    end

    private

    def formatted_result(result)
      "Weather description: #{result['weather'].first['description']},\n"\
      "Thermical sensation: #{result['main']['feels_like']},\n"\
      "Temperature: min: #{result['main']['temp_min']}, current: #{result['main']['temp']}, máx: #{result['main']['temp_max']}"\
    end
  end
end
