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

# module Ruboty
#   module Extension
#     module Rss
#       class Sample < Base
#       end
#     end
#   end
# end

