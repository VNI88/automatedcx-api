# typed: false
require 'test_helper'

class UserEventTest < ActiveSupport::TestCase
  setup do
    @user = User.last
  end

  test 'should set no previous or next event as default value on event creation' do
    event = Event.create!(
                    name: 'test_event',
                    category: 'test',
                    user_id: @user.id,
            )

    assert_equal event.previous_event_name, 'no_previous_event'
    assert_equal event.next_event_name, 'no_next_event'
  end

  test 'should set previous_event_id if there is a previous event' do
    first_event = Event.create!(
                    name: 'test_event',
                    category: 'test',
                    user_id: @user.id
            )

    second_event = Event.create!(
                    name: 'test_event_2',
                    category: 'test',
                    previous_event_name: 'test_event',
                    user_id: @user.id
            )
    assert_not_nil second_event.previous_event_id
    assert_equal second_event.previous_event_id, first_event.id
  end
end
