require 'telegram/bot'

module MessageSender
  class Telegram
    def initialize(chat_id, message)
      @chat_id = chat_id
      @message = message
    end

    def call
      ::Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
        bot.api.send_message(chat_id: @chat_id, text: @message)
      end

      OpenStruct.new({
        success?: true,
        payload: {
          chat_id: @chat_id,
          text: @message
        }
      })
    rescue StandardError => e
      Raven.capture_exception(e)
      Rails.logger.error(e)
      OpenStruct.new({ success?: false, error: e })
    end
  end
end
