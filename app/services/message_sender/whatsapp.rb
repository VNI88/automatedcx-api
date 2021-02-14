# frozen_string_literal: true

require 'twilio-ruby'

# This class is responsible for sending whatsapp messages
# when a routine trigger gets actioned
module MessageSender
  class Whatsapp
    def initialize(recipient_phone_number, message)
      @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      @recipient_phone_number = recipient_phone_number
      @message = message
    end

    def call
      begin
        message = @client.messages.create(
          body: @message,
          to: "whatsapp:#{@recipient_phone_number}",
          from: "whatsapp: +14155238886"
        )

        Rails.logger.info(message.sid)
        OpenStruct.new({
          success: true,
          payload: {
            recipient_phone_number: @recipient_phone_number,
            message: @message
          }
        })
      rescue StandardError => error
        Raven.capture_exception(error)
        Rails.logger.error(error)
        OpenStruct.new({ success?: false, error: error })
      end
    end
  end
end
