require 'test_helper'
require_relative '../../../lib/bot/telegram_app'

class TelegramAppTest < ActiveSupport::TestCase
 def setup
   Timecop.freeze(Time.local(2020, 10, 9, 21, 18, 15))
 end

 test 'should send a message to a group' do
   skip 'Until we discover how to run the request in a proper way'
   VCR.use_cassette("send a message to a telegram group") do
     message_logs = Bot::TelegramApp.reply_conversation('fake_id', 'HELLO MY FRIENDS')
     assert message_logs['ok']
     assert message_logs['result']['from']['is_bot']
     assert_equal 'supergroup', message_logs['result']['chat']['type']
     assert_equal 'Dorothy', message_logs['result']['from']['first_name']
   end
 end
end
