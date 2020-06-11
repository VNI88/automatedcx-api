require 'test_helper'

class AppStatusWorkeTest < ActiveJob::TestCase
  test 'shoud validate if the api is up through job' do
    assert AppStatusWorker.perform_async
  end
end
