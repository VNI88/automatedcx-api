# frozen_string_literal: true

require 'sidekiq'
require 'httparty'

class AppStatusWorker
  include HTTParty
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    begin
      response = HTTParty.get('https://automatedcx-api-staging.herokuapp.com/ping')
      raise StandardError, Raven.capture_exception('Automatedcx Api is down') unless response.code == 200
      response.code
    rescue StandardError => error
      Raven.capture_exception(error)
    end
  end
end
