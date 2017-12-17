require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :"en"
    config.time_zone = "Beijing"
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
        console do

      require "pry"
      config.console = Pry
    end
    # redis_url = ENV['REDIS_URL'] || "redis://redis:6379"

    # redis_config_hash = {url: "#{redis_url}/0/cache", expires_in: 1.days}
    # config.cache_store = :redis_store, redis_config_hash
  end
end
