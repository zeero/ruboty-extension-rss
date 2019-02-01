require 'test_helper'

describe Ruboty::Extension::RSS::Feed do
  subject { Ruboty::Extension::RSS::Feed }

  describe '.new' do
    it 'should create Entry' do
      url = 'https://github.com/zeero/ruboty-extension-rss/commits/master.atom'
      feed = subject.new(url)
      feed.entries.first.must_be_instance_of Ruboty::Extension::RSS::Feed::Entry
    end
  end
end

