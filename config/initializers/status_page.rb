StatusPage.configure do
  # Cache check status result 10 seconds
  self.interval = 10
  # Use service
  self.use :database
  self.use :cache
  # Custom redis url
  self.use :redis, url: ENV['REDIS_URL']
  self.use :sidekiq
end
