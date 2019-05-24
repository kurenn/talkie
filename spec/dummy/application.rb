require "rails/all"
require "talkie"

module Dummy
  APP_ROOT = File.expand_path("..", __FILE__).freeze

  I18n.enforce_available_locales = true

  class Application < Rails::Application

    I18n.enforce_available_locales = true

    config.active_support.deprecation = :stderr
    config.active_support.test_order = :random
    config.cache_classes = true
    config.consider_all_requests_local = true
    config.eager_load = false
    config.encoding = "utf-8"
    config.paths["app/controllers"] << "#{APP_ROOT}/app/controllers"
    config.paths["app/models"] << "#{APP_ROOT}/app/models"
    config.paths["app/views"] << "#{APP_ROOT}/app/views"
    config.paths["config/database"] = "#{APP_ROOT}/config/database.yml"
    config.paths["log"] = "tmp/log/development.log"

    config.paths.add "config/routes.rb", with: "#{APP_ROOT}/config/routes.rb"
    config.secret_key_base = "SECRET_KEY_BASE"

    if config.active_record.sqlite3.respond_to?(:represent_boolean_as_integer)
      config.active_record.sqlite3.represent_boolean_as_integer = true
    end

    def require_environment!
      initialize!
    end

    def initialize!(&block)
      FileUtils.mkdir_p(Rails.root.join("db").to_s)
      super unless @initialized
    end
  end
end
