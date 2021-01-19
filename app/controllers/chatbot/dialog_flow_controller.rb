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
        render json: wikipedia_consulter_formatted_response(result[:payload]).to_json
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
        render json: google_consulter_formatted_response(result[:payload]).to_json
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
        render json: weather_checker_formatted_response(result[:payload]).to_json
      else
        render status: :bad_request
      end
    end

    render status: :not_found
  end

  def wikipedia_consulter_formatted_response(payload)
    rendered_text = if result.text.present?
                      "#{payload.text.slice(0, 150)}...\b complete article: #{payload.fullurl}"
                    else
                      "I didn't find anything related :("
                    end

    dialog_flow_structure(rendered_text)
  end

  def google_consulter_formatted_response(payload)
    rendered_text = if payload.any?
                      "The results of your research are: \b #{payload}"
                    else
                      "I didn't find anything related :("
                    end

    dialog_flow_structure(rendered_text)
  end

  def weather_checker_formatted_response(payload)
    rendered_text = "Here is the weather data for this location:\n #{payload}"
    dialog_flow_structure(rendered_text)
  end

  def dialog_flow_structure(rendered_text)
    {
      speech: rendered_text,
      displayText: rendered_text,
      data: "",
      source: 'Chatbot'
    }
  end
end

