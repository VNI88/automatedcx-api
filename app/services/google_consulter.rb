# frozen_string_literal: true

# This class is responsible to make a research on Google

class GoogleConsulter
 def initialize(theme)
   @theme = theme
 end

 def call
   result = GoogleCustomSearchApi.search(@theme)
   OpenStruct.new({ success?: true, payload: formatted_result(result) })
  rescue StandardError => e
    Raven.capture_exception(e)
    OpenStruct.new({ success?: false, error: e})
 end

 private

 def formatted_result(result)
   items = result.to_h['items'].slice(0, 3).map do|item|
     {
       title: item['title'],
       link: item['link']
     }
   end
 end
end
