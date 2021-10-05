release: rake db:migrate
web: RAILS_ENV=production rails server
worker: bundle exec sidekiq -c 2
redis: redis-server
webpack: bin/webpack-dev-server
telegram_bot: bundle exec ruby bin/bot.rb
