
module Ruboty
  module Extension
    module Rss
      # Your code goes here...
    end
  end
end

Dir[File.expand_path('extension-rss', __dir__) << '/**/*.rb'].each { |file| require file }
Dir[File.expand_path('handlers', __dir__) << '/**/*.rb'].each { |file| require file }

