# typed: false
class Chatbot::WhatsappController < ApplicationController
  # before_action :allow_twilio_webhook
  skip_before_action :verify_authenticity_token

  def create
    request_body = request[:Body].downcase
    response = Twilio::TwiML::MessagingResponse.new
    response.message do |message|
      if request_body.include?('hello')
        message.body('Hello, type actions to see what I\'m capable of!')
      elsif request_body.include?('actions')
        response_message = "Right, you can choose among the following options - must type and send me the message like the example:\n"\
          "- search/theme - theme that you want to search;\n"\
          "- company_history/company_name;\n"\
          '- weather.'
        message.body(response_message)
      elsif request_body.include?('search')
        message.body(search_on_google(request_body.split('/').second))
      elsif request_body.include?('company_history')
        message.body(search_on_wikipedia(request_body.split('/').second))
      elsif request_body.include?('weather')
        message.body(check_weather(request_body.split('/').second))
      end
    end
    render xml: response.to_xml, status: 200
  rescue StandardError => e
    Sentry.capture_exception(e)
    render status: :unprocessable_entity
  end

  private

  def allow_twilio_webhook
    use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/chatbot/whatsapp'
  end
end
