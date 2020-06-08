require 'test_helper'

class PingControllerTest < ActionDispatch::IntegrationTest
  test 'should ping the application successfully' do
     get ping_url
     assert_response :success
  end
end
