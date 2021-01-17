class Chatbot::DialogFlowController < ApplicationController
  def create
    intent = params[:queryResult][:intent][:name]
    case intent
    when 'wikipedia'
      search_on_wikipedia
    when 'google'
      search_on_google
    when 'weather'
      check_weather
    else
      Raven.capture_exception('Unknown dialog flow intent')
      render status: :not_found
    end
  rescue StandardError => e
    Raven.capture_exception(e)
    render status: :unprocessable_entity
  end

  private

  def search_on_wikipedia
    theme = params[:queryResult][:parameters]['theme']
    if theme.present?
      result = WikipediaConsulter.new(theme).call

      if result[:success?]
        render json: result[:payload].to_json
      else
        render status: :bad_request
      end
    end

    render status: :not_found
  end

  def search_on_google
    theme = params[:queryResult][:parameters]['theme']
    if theme.present?
      result = GoogleConsulter.new(theme).call

      if result[:success?]
        render json: result[:payload].to_json
      else
        render status: :bad_request
      end
    end

    render status: :not_found
  end

  def check_weather
    location = params[:queryResult][:parameters]['location']
    if location.present?
      result = WeatherConsulter.new(location).call

      if result[:success?]
        render json: result.to_json
      else
        render status: :bad_request
      end
    end

    render status: :not_found
  end
end
