module Ruboty
  class Robot
    alias original_adapt adapt

    private

    def adapt
      extension_rss
      original_adapt
    end

    def extension_rss
      rsses.each(&:run)
    end

    def rsses
      Ruboty::Extension::Rss::Builder.new(self).build
    end
  end
end

