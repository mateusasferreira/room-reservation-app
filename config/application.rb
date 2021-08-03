require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

    config.i18n.available_locales = [:en, :pt]
    config.i18n.default_locale = :pt
    config.i18n.fallbacks = true
    config.beginning_of_week = :monday
    config.end_of_week = :friday
    config.time_zone = "Brasilia"    
  end
end
