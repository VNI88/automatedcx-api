# frozen_string_literal: true

require 'twilio-ruby'

module MessageSender
  # This class is responsible for sending whatsapp messages
  # when a routine trigger gets actioned
  class Whatsapp
    def initialize(recipient_phone_number, message)
      @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      @recipient_phone_number = recipient_phone_number
      @message = message
    end

    def call
      twilio_response = send_message
      Rails.logger.info(twilio_response.sid)
      service_response
    rescue MessageSender::WhatsappError => e
      Raven.capture_exception(e)
      Rails.logger.error(e)
      OpenStruct.new({ success?: false, error: e })
    end

    private

    def send_message
      @client.messages.create(
        body: @message,
        to: "whatsapp:#{@recipient_phone_number}",
        from: 'whatsapp: +14155238886'
      )
    end

    def service_response
      OpenStruct.new(
        {
          success: true,
          payload: {
            recipient_phone_number: @recipient_phone_number,
            message: @message
          }
        }
      )
    end
  end

  class WhatsappError < StandardError; end
end
