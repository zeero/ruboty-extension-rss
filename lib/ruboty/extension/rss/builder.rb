module Ruboty
  module Extension
    module Rss
      class Builder
        attr_reader :robot

        def initialize(robot)
          @robot = robot
        end

        def build
          puts 'Rss::Builder#build'
          Ruboty::Extenision::Rss.rsses.map { |rss| rss.new(robot) }

          # TODO
          []
        end
      end
    end
  end
end

