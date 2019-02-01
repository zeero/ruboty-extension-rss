require 'open-uri'
require 'feed-normalizer'

module Ruboty
  module Extension
    module RSS
      class Checker
        def initialize(url)
          @url = url
          @last_links = Feed.new(url).entries.map(&:link)
        end

        def new_entries
          items = Feed.new(@url).entries
          new_items = items.reject { |item| @last_links.include? item.link }
          @last_links = items.map(&:link)
          new_items
        end
      end
    end
  end
end
