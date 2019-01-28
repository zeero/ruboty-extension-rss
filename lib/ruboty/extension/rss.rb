require 'active_support'
require 'active_support/core_ext'
require 'i18n'
require 'mem'

module Ruboty
  module Extension
    module Rss
      class << self
        include Mem

        def rsses
          []
        end
        memoize :rsses

        def to_positive_i(obj)
          i = obj.to_i
          i > 0 ? i : nil
        end
      end

      INTERVAL = to_positive_i(ENV['RUBOTY_EXTENSION_RSS_INTERVAL']) || 1.hour.to_i
    end
  end
end

require_relative '../robot.patch'
Dir[File.expand_path('rss', __dir__) << '/**/*.rb'].each { |file| require file }
Dir[File.expand_path('../rsses', __dir__) << '/**/*.rb'].each { |file| require file }

# I18n.load_path << Dir[File.expand_path('router/locale/*.yml', __dir__)]

