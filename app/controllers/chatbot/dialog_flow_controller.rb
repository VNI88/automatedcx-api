class Chatbot::DialogFlowController < ApplicationController
 skip_before_action :verify_authenticity_token

  def create
    intent = params[:queryResult][:action].downcase
    case intent
    when 'wikipedia'
      send_message_to(params['originalDetectIntentRequest']['source'], search_on_wikipedia)
    when 'google'
      send_message_to(params['originalDetectIntentRequest']['source'], search_on_google)
    when 'weather'
      send_message_to(params['originalDetectIntentRequest']['source'], check_weather)
    else
      Raven.capture_exception('Unknown dialog flow intent')
      render status: :not_found
    end
  rescue StandardError => e
    Raven.capture_exception(e)
    render status: :unprocessable_entity
  end

  def show
    render plain: params['hub.challenge'].to_s if ENV['VERIFY_TOKEN'] == params['hub.verify_token']
  end

  private

  def send_message_to(source, message)
    case source
    when 'telegram'
      chat_id = params['originalDetectIntentRequest']['payload']['data']['chat']['id']
      MessageSender::Telegram.new(chat_id, message).call
    when 'facebook'
      sender_id = params['originalDetectIntentRequest']['payload']['data']['sender']['id']
      messenger_response = {
        fulfillmentMessages: [
          {
            text: {
              text: [
                message
              ]
            }
          },
        ],
        fulfillmentText: "response",
        source: "Test"
      }
      render json: messenger_response
    end
  end
end

