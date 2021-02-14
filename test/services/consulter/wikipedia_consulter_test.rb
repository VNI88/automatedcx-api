require 'test_helper'

class Consulter::WikipediaTest < ActiveSupport::TestCase
  test 'should bring the result of a consult on wikipedia successfully' do
    VCR.use_cassette('should bring the result of a consult on wikipedia successfully') do
      result = Consulter::Wikipedia.new('Ruby on Rails').call

      assert result[:success?]
      refute result[:payload].json.nil?
    end
  end
end
