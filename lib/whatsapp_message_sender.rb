# frozen_string_literal: true

require 'twilio-ruby'

# This class is responsible for sending whatsapp messages
# when a routine trigger gets actioned
class WhatsappMessageSender
  def initialize
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
  end

  def send_message(recipient_telephone_number, message_body)
    begin
      message = @client.messages.create(
        body: message_body,
        to: recipient_telephone_number,
        from: "+15005550006"
      )

      Rails.logger.info(message.sid)
    rescue StandardError => error
      Raven.capture_exception(error)
    end
  end
end
