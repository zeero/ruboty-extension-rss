module Ruboty
  module Rsses
    class Base
      class << self
        include Mem

        def inherited(child)
          Ruboty::Extension::Rss.rsses << child
        end

        def rss(url, options = {})
          # actions << Rss::Action.new(url, options)
        end

        def actions
          []
        end
        memoize :actions
      end

      include Env::Validatable

      attr_reader :robot

      def initialize(robot)
        @robot = robot
        validate!
      end

      def call(options = {})
        # self.class.actions.inject({}) do |routes, action|
        #   routes.merge!(action.call(self, options))
        # end
      end
    end
  end
end
