# typed: false
require 'facebook/messenger'

module MessageSenders
  class Facebook
    include ::Facebook::Messenger

    def initialize(chat_id, page_id, message)
      @chat_id = chat_id
      @page_id = page_id
      @message = message
    end

    def call
      Bot.deliver(
        {
          recipient: {
            id: @chat_id
          },
          message: {
            text: @message
          },
          messaging_type: 'UPDATE'
        }, access_token: ENV['access_token'])

      OpenStruct.new({
        success?: true,
        payload: {
          chat_id: @chat_id,
          page_id: @page_id,
          text: @message
        }
      })
    rescue StandardError => e
      Sentry.capture_exception(e)
      Rails.logger.error(e)
      OpenStruct.new({ success?: false, error: e })
    end
  end
end
