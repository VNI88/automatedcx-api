require 'test_helper'

class WikipediaConsulterTest < ActiveSupport::TestCase
  test 'should bring the result of a consult on wikipedia successfully' do
    VCR.use_cassette('should bring the result of a consult on wikipedia successfully') do
      result = WikipediaConsulter.new('Ruby on Rails').call
      assert result[:success?]
      refute result[:payload][:speech].nil?
      refute result[:payload][:displayText].nil?
    end
  end
end
