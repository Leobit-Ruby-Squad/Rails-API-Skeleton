require_relative 'boot'

require_relative 'router'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module RailsApiSkeleton
  class Application < Rails::Application
    ADDITIONAL_ABSTRACTION_LAYERS = %w[operations].freeze
    LIB_PATH                      = Rails.root.join('lib').freeze

    config.load_defaults 5.1
    config.api_only = true

    config.autoload_paths += [
      *ADDITIONAL_ABSTRACTION_LAYERS,
      LIB_PATH
    ]
  end
end
