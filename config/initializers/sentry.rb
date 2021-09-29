# frozen_string_literal

Sentry.init do |config|
  config.dsn = 'https://88f9b757447b4c1d9bbcb6162dcf81de@o404238.ingest.sentry.io/5267631'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.environment = %i[production staging development]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 0.5
  config.release = 'v9.0.0'
end
