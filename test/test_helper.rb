require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/minitest'

require 'ruboty'

require 'ruboty/extension/rss'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

RSS_SAMPLE_URL = 'https://github.com/zeero/ruboty-extension-rss/commits/master.atom'.freeze

module Ruboty
  module Rsses
    class Sample < Base
      rss(RSS_SAMPLE_URL, name: 'github', description: 'commit feed from github', interval: 1)

      def github(entry)
        entry
      end
    end
  end
end

