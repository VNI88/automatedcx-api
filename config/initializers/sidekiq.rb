
Sidekiq.configure_server do |config|
  redis_url = Rails.env == 'production' ? ENV['REDIS_PRODUCTION_URL'] : ENV['REDIS_STAGING_URL']
  config.redis = { url: redis_url || 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  redis_url = Rails.env == 'production' ? ENV['REDIS_PRODUCTION_URL'] : ENV['REDIS_STAGING_URL']
  config.redis = { url: redis_url || 'redis://localhost:6379/0' }
end
