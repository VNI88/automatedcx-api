require 'telegram/bot'

module Bot
  class TelegramApp
    def self.perform
      Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
        bot.listen do |message|
          case message.text
          when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, I'm AutomatedCX Bot type /help to see what I can do.")
          when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)
          when '/help'
            bot.api.send_message(chat_id: message.chat.id, text: "Here are my commands:\nstart - Hello compliment,\n/stop - Farewell compliment,\n/help - List my commands.", date: message.date)
          else
            bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop or /help.")
          end
        end
      end
    end

    def self.reply_conversation(_chat_id, message)
      Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
        bot.api.send_message(chat_id: -1001187107517, text: message)
      end
    end
  end
end
