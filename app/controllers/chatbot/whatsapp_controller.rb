class Chatbot::WhatsappController < ApplicationController
  before_action :allow_twilio_webhook

  def create
    WhatsappMessageReader.new(params[:body]).call
    WhatsappMessageSender.new(params[:body]).call
  end

  private

  def allow_twilio_webhook
    use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/chatbot/whatsapp'
  end
end
