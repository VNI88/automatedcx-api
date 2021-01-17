# frozen_string_literal: true

require 'open_weather'

# This class is responsible to check weather in a
# specific location

class WeatherConsulter
 def initialize(location)
   @location = location
 end

 def call
    WeatherConsulter.new(params[:result][:parameters]['location']).call
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
      OpenStruct.new({ success?: false , error: 'Location not found.') })
    end
 rescue StandardError => e
   Raven.capture_exception(e)
   OpenStruct.new({ success?: false, error: e })
  end

  private

  def formatted_result(result)
    {
      weather: result['weather'].first['description'],
      feels_like: result['main']['feels_like'],
      temperature: {
        current: result['main']['temp_min'],
        min: result['main']['temp_min'],
        max: result['main']['temp_max']
      }
    }
  end
end
