module Ruboty
  module Extension
    module Rss
      class Job
        def initialize(rss, url, name, options = {})
          @rss = rss
          @checker = Checker.new(url)
          @name = name
          @interval = self.class.parent.to_positive_i(options[:interval]) || INTERVAL
          @options = options
        end

        def start
          @thread = Thread.new { run }
        end

        def stop
          Thread.kill(@thread) if @thread.present?
        end

        private

        def run
          loop do
            sleep @interval
            check
          end
        end

        def check
          @checker.new_entries.each do |entry|
            @rss.send(@name, entry)
          end
        end
      end
    end
  end
end

