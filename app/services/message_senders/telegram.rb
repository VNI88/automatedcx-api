# typed: true
# frozen_string_literal: true

require 'telegram/bot'

module MessageSenders
  # Class responsible to send messages to Telegram users
  class Telegram
    def initialize(chat_id, message)
      @chat_id = chat_id
      @message = message
    end

    def call
      ::Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
        bot.api.send_message(chat_id: @chat_id, text: @message)
      end
    rescue StandardError => e
      Sentry.capture_exception(e)
      Rails.logger.error(e)
      OpenStruct.new({ success?: false, error: e.message })
    end

    private

    def service_response
      OpenStruct.new(
        {
          success?: true,
          payload: {
            chat_id: @chat_id,
            text: @message
          }
        }
      )
    end
  end
end
