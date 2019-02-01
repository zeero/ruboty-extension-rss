module Ruboty
  module RSSes
    class Base
      class << self
        include Mem

        def inherited(child)
          Ruboty::Extension::RSS.rsses << child
        end

        def rss(url, options = {})
          name = options[:name]
          jobs << Ruboty::Extension::RSS::Job.new(url, name, options)
        end

        def jobs
          []
        end
        memoize :jobs
      end

      include Env::Validatable

      attr_reader :robot

      def initialize(robot)
        @robot = robot
        validate!
      end

      def call(_options = {})
        self.class.jobs.map { |job| job.start(self) }
      end
    end
  end
end

