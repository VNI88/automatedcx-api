# typed: false
require 'test_helper'

class VersionControllerTest < ActionDispatch::IntegrationTest
  test 'should show the application version successfully' do
     get version_url
     assert_response :success
  end
end
