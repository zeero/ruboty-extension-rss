module Ruboty
  module Extension
    module Rss
      class Builder
        attr_reader :robot

        def initialize(robot)
          @robot = robot
        end

        def build
          # TODO
          puts 'Rss::Builder#build'
          # Ruboty::Extenision::Rss.rsses.inject({}) { |result, router| result.merge!(router.new(robot).call) }
        end
      end
    end
  end
end

