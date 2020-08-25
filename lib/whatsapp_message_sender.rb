# frozen_string_literal: true

require 'twilio-ruby'

# This class is responsible for sending whatsapp messages
# when a routine trigger gets actioned
class WhatsappMessageSender
  def initialize
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_message(recipient_phone_number, message_body)
    begin
      message = @client.messages.create(
        body: message_body,
        to: "whatsapp:#{recipient_phone_number}",
        from: "whatsapp: +14155238886"
      )

      Rails.logger.info(message.sid)
    rescue StandardError => error
      Raven.capture_exception(error)
    end
  end
end
