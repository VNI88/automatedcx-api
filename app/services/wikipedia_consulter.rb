# frozen_string_literal: true

require 'wikipedia'

# This class is responsible to make a research on Wikipedia

class WikipediaConsulter
 def initialize(theme)
   @theme = theme
 end

 def call
   result = Wikipedia.find(@theme)
   OpenStruct.new({ success?: true, payload: formatted_result(result) })
  rescue StandardError => e
    Raven.capture_exception(e)
    OpenStruct.new({ success?: false, error: e})
 end

 private

 def formatted_result(result)
   rendered_text = if result.text.present?
              "#{result.text.slice(0, 150)}...\b complete article: #{result.fullurl}"
            else
              "I didn't find anything related :("
            end
   {
     speech: rendered_text,
     displayText: rendered_text,
     data: "",
     source: 'Chatbot'
   }
 end
end
