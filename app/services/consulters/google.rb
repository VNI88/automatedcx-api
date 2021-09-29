# typed: true
# frozen_string_literal: true

# This class is responsible to make a research on Google

module Consulter
  class Google
    def initialize(theme)
      @theme = theme
    end

    def call
      result = GoogleCustomSearchApi.search(@theme)
      OpenStruct.new({ success?: true, payload: formatted_result(result) })
    rescue StandardError => e
      Sentry.capture_exception(e)
      OpenStruct.new({ success?: false, error: e})
    end

    private

    def formatted_result(result)
      items = result.to_h['items']
      "The first result of your research is title - #{items[0]['title']}, link - #{items[0]['link']}, the number of results are #{items.size}"\
    end
  end
end
