module Ruboty
  module Extension
    module RSS
      class Job
        def initialize(url, name, options = {})
          @checker = Checker.new(url)
          @name = name
          @interval = self.class.parent.to_positive_i(options[:interval]) || self.class.parent::INTERVAL
          @options = options
        end

        def start(rss)
          @thread = Thread.new { run(rss) }
        end

        def stop
          Thread.kill(@thread) if @thread.present?
        end

        private

        def run(rss)
          loop do
            sleep @interval
            check(rss)
          end
        end

        def check(rss)
          @checker.new_entries.each do |entry|
            rss.send(@name, entry) if rss.respond_to? @name
          end
        end
      end
    end
  end
end

