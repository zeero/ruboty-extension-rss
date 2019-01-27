require 'open-uri'
require 'feed-normalizer'

module Ruboty
  module Extension
    module Rss
      class Feed
        attr_reader :entries

        def initialize(url)
          @url = url

          feed = FeedNormalizer::FeedNormalizer.parse open(url)
          @entries = feed.entries.map { |entry| Entry.new(entry) }
        end

        class Entry
          attr_reader :title, :link, :description

          def initialize(entry)
            @title = entry.title
            @link = entry.url
            @description = entry.description
          end
        end
      end
    end
  end
end
