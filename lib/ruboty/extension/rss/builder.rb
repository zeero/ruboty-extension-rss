module Ruboty
  module Extension
    module Rss
      class Builder
        attr_reader :robot

        def initialize(robot)
          @robot = robot
        end

        def build
          self.class.parent.rsses.map { |rss| rss.new(robot) }
        end
      end
    end
  end
end

