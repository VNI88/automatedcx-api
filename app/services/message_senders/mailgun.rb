# typed: true
# frozen_string_literal: true

require 'mailgun-ruby'

module MessageSenders
  # Class resposible for sending emails trough mailgun gem
  class Mailgun
    def initialize(from:, to:, subject:, text:)
      @message = {
        from: from,
        to: to,
        subject: subject,
        text: text
      }
    end

    def call
      mailgun_client = ::Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
      mailgun_client.send_message(ENV['MAILGUN_DOMAIN'], @message)
      service_response(success_flag: true, payload: @message)
    rescue StandardError => e
      Sentry.capture_exception(e)
      service_response(success_flag: false, error: e.message)
    end

    private

    def service_response(success_flag:, payload: nil, error: nil)
      OpenStruct.new(
        {
          success?: success_flag,
          payload: payload,
          error: error
        }
      ).to_h.delete_if { |_key, value| value.nil? }
    end
  end
end
