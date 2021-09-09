# typed: false
require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'should create an event succesfully' do
    natura_user = users(:natura_user)

    post '/events',
      params: {
        name: 'test_event',
        category: 'test_category'
      },
      headers: { "Authorization": "Bearer #{natura_user.api_key}" }
    assert_equal Event.count, 1
  end
end
