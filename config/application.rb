require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV['RAILS_ADMIN_THEME'] = 'rollincode'

module AutomatedcxApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults '6.0'
    config.autoload_paths << Rails.root.join('app', 'lib', 'modules')

    Redis.exists_returns_integer =  true

    config.active_job.queue_adapter = :sidekiq

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # if Rails.env.test?
      # Update version file from latest git tag
      # File.open('config/version', 'w') do |file|
        # file.write `git describe --tags`
      # end
    # end

    # config.application_version = File.read('config/version')
  end
end
